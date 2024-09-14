using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;

public partial class AddProduct : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblErrorMessage.Text = ""; 

        if (Session["Type"] == "Seller")
        {
            string sellerEmail = Session["EmailID"].ToString();
            GetSellerInfo(sellerEmail);
        }
        else
        {
            Response.Redirect("LoginWarning.aspx");
        }
    }

    private void GetSellerInfo(string email)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Browse_BazarConnectionString4"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "SELECT FirstName, LastName FROM Seller WHERE EmailId = @Email";
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@Email", email);
                

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    lblSellerName.Text = reader["FirstName"].ToString() + " " + reader["LastName"].ToString();
                }
                connection.Close();
            }
        }
    }

    protected void btnAddProduct_Click(object sender, EventArgs e)
    {
        string productName = txtProductName.Text;
        string productDescription = txtProductDescription.Text;
        int productPrice = int.Parse(txtProductPrice.Text);
        int productQty = int.Parse(txtProductQty.Text);
        string category = ddlCategory.SelectedValue;
        string sellerEmail = Session["EmailID"].ToString();
        string sellerName = lblSellerName.Text;
        string productImagePath = "";

        if (fulProductImage.HasFile)
        {
            try
            {
                Random random = new Random();
                string filename = Path.GetFileName(fulProductImage.FileName);
                string uploadFilename = txtProductName.Text.Replace(' ', '_');
                string folderPath = Server.MapPath("/ProductImages/");

                fulProductImage.SaveAs(Path.Combine(folderPath, filename));

                string sourceFilePath = folderPath + filename;
                string randomNumber = random.Next().ToString();
                string destinationFilePath = folderPath + uploadFilename + randomNumber + ".jpeg";

                File.Move(sourceFilePath, destinationFilePath);

                productImagePath = uploadFilename + randomNumber + ".jpeg";
            }
            catch (Exception ex)
            {
                
                lblErrorMessage.Text = "Image upload error: " + ex.Message;
                return;
            }
        }

        try
        {
            
            string connectionString = ConfigurationManager.ConnectionStrings["Browse_BazarConnectionString4"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Product (Seller_Email_Id, Seller_Name, Product_Name, Product_Description, Product_Price, Product_Quantity, Product_Category, Product_Image_Path) " +
                               "VALUES (@SellerEmail, @SellerName, @ProductName, @ProductDescription, @ProductPrice, @ProductQty, @Category, @ProductImagePath)";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@SellerEmail", sellerEmail);
                    command.Parameters.AddWithValue("@SellerName", sellerName);
                    command.Parameters.AddWithValue("@ProductName", productName);
                    command.Parameters.AddWithValue("@ProductDescription", productDescription);
                    command.Parameters.AddWithValue("@ProductPrice", productPrice);
                    command.Parameters.AddWithValue("@ProductQty", productQty);
                    command.Parameters.AddWithValue("@Category", category);
                    command.Parameters.AddWithValue("@ProductImagePath", productImagePath);
                    command.CommandTimeout = 120; 

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }

            
            ClearFields();
        }
        catch (Exception ex)
        {
            
            lblErrorMessage.Text = "Database insert error: " + ex.Message;
        }
    }

    protected void btnClearFields_Click(object sender, EventArgs e)
    {
        ClearFields();
    }

    private void ClearFields()
    {
        txtProductName.Text = string.Empty;
        txtProductDescription.Text = string.Empty;
        txtProductPrice.Text = string.Empty;
        txtProductQty.Text = string.Empty;
        ddlCategory.SelectedIndex = 0;
        fulProductImage.Attributes.Clear();
    }
}
