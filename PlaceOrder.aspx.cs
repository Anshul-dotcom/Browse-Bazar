using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.Reflection.Emit;

public partial class PlaceOrder : System.Web.UI.Page
{
    string orderDate, uniqueOrderID;
    string connectionString = ConfigurationManager.ConnectionStrings["Browse_BazarConnectionString4"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["EmailId"] != null)
            {
                LoadSellerDetails();
                LoadCartItems();
                CalculateTotalPrice();
            }
            else
            {

                Response.Redirect("Login.aspx");
            }
        }
    }

    private void LoadSellerDetails()
    {
        var sellerDetails = GetSellerDetailsByEmail(Session["EmailId"].ToString());

        if (sellerDetails.Rows.Count > 0)
        {
            DataRow row = sellerDetails.Rows[0];
            lblEmail.Text = row["EmailId"].ToString();
            lblName.Text = "Name: " + row["FirstName"].ToString() + " " + row["LastName"].ToString();
            lblPhone.Text = "Phone: " + row["PhoneNumber"].ToString();
            lblAddress.Text = "Address: " + row["Address"].ToString();
        }
        else
        {
            lblEmail.Text = "Seller details not found.";
        }
    }

    private void LoadCartItems()
    {
        if (Session["FirstName"] != null)
        {
            if (Session["AddedProductList"] != null)
            {
                string addedProductList = Session["AddedProductList"].ToString();
                if (!string.IsNullOrEmpty(addedProductList))
                {

                    if (addedProductList.EndsWith(","))
                    {
                        addedProductList = addedProductList.Remove(addedProductList.Length - 1);
                    }


                    string query = "SELECT Product_Name, Product_Price FROM Product WHERE Product_ID IN (" + addedProductList + ")";


                    PlaceOrderSource1.SelectCommand = query;
                    string finalOrderQuery = "Select Product_ID, Product_Name, Product_Description,Product_Price, Product_Quantity FROM Product where Product_ID IN (" + addedProductList + ")";
                    OrderDetailSource1.SelectCommand = finalOrderQuery;
                    Label3.Text = finalOrderQuery;
                }
                else
                {
                    Response.Redirect("EmptyCart.aspx");
                }
            }
            else
            {
                Response.Redirect("EmptyCart.aspx");
            }
        }
        else
        {
            Response.Redirect("LoginWarning.aspx");
        }
    }

    private void CalculateTotalPrice()
    {
        if (Session["AddedProductList"] != null)
        {
            string addedProductList = Session["AddedProductList"].ToString();
            if (!string.IsNullOrEmpty(addedProductList))
            {

                if (addedProductList.EndsWith(","))
                {
                    addedProductList = addedProductList.Remove(addedProductList.Length - 1);
                }

                string connectionString = ConfigurationManager.ConnectionStrings["Browse_BazarConnectionString4"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "SELECT SUM(Product_Price) FROM Product WHERE Product_ID IN (" + addedProductList + ")";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        con.Open();
                        object result = cmd.ExecuteScalar();
                        con.Close();

                        if (result != DBNull.Value)
                        {
                            decimal totalPrice = Convert.ToDecimal(result);
                            lblTotalOrderValue.Text = "Total Price: " + totalPrice.ToString("C");
                        }
                        else
                        {
                            lblTotalOrderValue.Text = "Total Price: $0.00";
                        }
                    }
                }
            }
        }
    }

    private DataTable GetSellerDetailsByEmail(string email)
    {
        DataTable dt = new DataTable();
        string connectionString = ConfigurationManager.ConnectionStrings["Browse_BazarConnectionString4"].ConnectionString;
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            string query = "SELECT EmailId, FirstName, LastName, PhoneNumber, Address FROM Seller WHERE EmailId = @EmailId";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@EmailId", email);
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    sda.Fill(dt);
                }
            }
        }
        return dt;
    }

    protected void btnConfirmOrder_Click(object sender, EventArgs e)
    {
        prepareOrder();
        sendOrderEmail();
        Session.Remove("AddedProductList");
       Response.Redirect("Thankyou.aspx");
    }

    protected void btnCancelOrder_Click(object sender, EventArgs e)
    {
        Session.Remove("AddedProductList");
        Response.Redirect("ViewProduct.aspx");
    }
    protected void sendOrderEmail()
    {
        string mail_header = "Dear " + Session["FirstName"].ToString() + ",\n \n Thank you for shopping with us !! \n \n Your Order has been successfully placed with us \n \n Order # " + uniqueOrderID;
        string orderDetails = "\n ";
        string lineText = "\n--------------------------------------------------------------------------------------------";
        int SNO = 1;
        string totalOrderValue = "\n Total Order Value : " + lblTotalOrderValue.Text + "\n";
        string user_address = "\n Shipping Address \n Name : " + lblName.Text + "\n Phone: " + "\n Address : " + lblAddress.Text + " \n \n Order Details \n  ";
        string mail_footer = "\n Thank you, \n Browse Bazar Admin Team \n Shop Again";
        foreach (GridViewRow row in GridView1.Rows)
        {
            orderDetails = orderDetails + SNO.ToString() + ". | " + row.Cells[0].Text + " | " + row.Cells[1].Text + " \n ";
            SNO = SNO + 1;
        }

        try
        {

            string senderEmail = "noreply.shoppers.choice@gmail.com";
            string senderPassword = "lujg qath oqjc sjtk"; 
            string senderName = "Browse Bazar Admin";

            string recipientEmail = lblEmail.Text;

            MailMessage mail = new MailMessage();
            mail.From = new MailAddress(senderEmail, senderName);
            mail.To.Add(new MailAddress(recipientEmail));
            mail.Subject = "Your Order # " + uniqueOrderID + " has been placed succesfully ";
            mail.Body = mail_header + user_address + lineText + orderDetails + lineText + totalOrderValue + mail_footer;

            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com");
            smtpClient.Port = 587; 
            smtpClient.EnableSsl = true; 
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = new NetworkCredential(senderEmail, senderPassword);

            smtpClient.Send(mail);
        }
        catch (Exception ex)
        {
        }


        Label2.Text = mail_header + user_address + lineText + orderDetails + lineText + totalOrderValue + mail_footer;
    }

    protected void prepareOrder()
    {
        orderDate = DateTime.Now.ToString("dd/MMM/yyyy_HH:mm:ss");
        Random rnd = new Random();
        uniqueOrderID = "OD7_" + rnd.Next(1000, 9999999) + "_" + orderDate;

        
        string addedProductList = Session["AddedProductList"].ToString();
        if (!string.IsNullOrEmpty(addedProductList))
        {
            if (addedProductList.EndsWith(","))
            {
                addedProductList = addedProductList.Remove(addedProductList.Length - 1);
            }

            string query = "SELECT Product_ID, Product_Name, Product_Description, Product_Price, Product_Quantity FROM Product WHERE Product_ID IN (" + addedProductList + ")";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        DataTable productTable = new DataTable();
                        productTable.Load(reader); 
                        connection.Close(); 

                       
                        foreach (DataRow row in productTable.Rows)
                        {
                            
                            string loadOrderQuery = "INSERT INTO OrderDetails (MainOrderID, EmailID, Name, MobileNumber, Address, ProductName, ProductAmount, OrderDate, PaymentMode) " +
                                                    "VALUES (@OrderID, @Email, @Name, @Phone, @Address, @ProductName, @ProductAmount, @OrderDate, 'COD')";

                            using (SqlCommand insertCommand = new SqlCommand(loadOrderQuery, connection))
                            {
                                insertCommand.Parameters.AddWithValue("@OrderID", uniqueOrderID);
                                insertCommand.Parameters.AddWithValue("@Email", lblEmail.Text);
                                insertCommand.Parameters.AddWithValue("@Name", lblName.Text);
                                insertCommand.Parameters.AddWithValue("@Phone", lblPhone.Text);
                                insertCommand.Parameters.AddWithValue("@Address", lblAddress.Text);
                                insertCommand.Parameters.AddWithValue("@ProductName", row["Product_Name"].ToString());
                                insertCommand.Parameters.AddWithValue("@ProductAmount", row["Product_Price"]);
                                insertCommand.Parameters.AddWithValue("@OrderDate", orderDate);

                                connection.Open();
                                insertCommand.ExecuteNonQuery();
                                connection.Close();
                            }

                            
                            int productQty = Convert.ToInt32(row["Product_Quantity"]) - 1;
                            int productID = Convert.ToInt32(row["Product_ID"]);

                            string updateProductQtyQuery = "UPDATE Product SET Product_Quantity = @ProductQty WHERE Product_ID = @ProductID";

                            using (SqlCommand updateCommand = new SqlCommand(updateProductQtyQuery, connection))
                            {
                                updateCommand.Parameters.AddWithValue("@ProductQty", productQty);
                                updateCommand.Parameters.AddWithValue("@ProductID", productID);

                                connection.Open();
                                updateCommand.ExecuteNonQuery();
                                connection.Close();
                            }
                        }
                    }
                }
            }
        }
    }






    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}