using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

public partial class Login : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
        string EmailId = UserId.Text;
        string password = Password.Text;
        string loginType = LoginType.SelectedValue.ToString();
        LoginError.Visible = true;
        LoginError.Text = loginType;

        string connectionString = ConfigurationManager.ConnectionStrings["Browse_BazarConnectionString4"].ConnectionString;

        try
        {
            if (loginType.Equals("Customer"))
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "SELECT EmailId, FirstName, LastName, PhoneNumber, Address FROM Customer WHERE [EmailId] = @EmailId AND [Password] = @Password";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@EmailId", EmailId);
                        cmd.Parameters.AddWithValue("@Password", password);

                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();

                        if (reader.Read())
                        {
                            LoginError.Visible = true;
                            LoginError.Text =query;
                            Session["EmailId"] = reader["EmailId"].ToString();
                            Session["FirstName"] = reader["FirstName"].ToString();
                            Session["LastName"] = reader["LastName"].ToString();
                            Session["PhoneNumber"] = reader["PhoneNumber"].ToString();
                            Session["Address"] = reader["Address"].ToString();
                            Session["Type"] = "Customer";
                            con.Close();
                            Response.Redirect("CustomerProfile.aspx");
                        }
                        else
                        {
                            con.Close();

                        }
                    }
                }
            }
            else if (loginType.Equals("Seller"))
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "SELECT EmailId, FirstName, LastName, PhoneNumber, Address, IFSCCode FROM Seller WHERE [EmailId] = @EmailId AND [Password] = @Password";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@EmailId", EmailId);
                        cmd.Parameters.AddWithValue("@Password", password);

                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();

                        if (reader.Read())
                        {
                            Session["EmailId"] = reader["EmailId"].ToString();
                            Session["FirstName"] = reader["FirstName"].ToString();
                            Session["LastName"] = reader["LastName"].ToString();
                            Session["PhoneNumber"] = reader["PhoneNumber"].ToString();
                            Session["Address"] = reader["Address"].ToString();
                            Session["IFSCCode"] = reader["IFSCCode"].ToString();
                            Session["Type"] = "Seller";
                            con.Close();
                            Response.Redirect("SellerProfile.aspx");
                        }
                        else
                        {
                            con.Close();

                        }
                    }
                }
            }
            else
            {
            }
        }
        catch (Exception ex)
        {
            
            LoginError.Visible = true;
            LoginError.Text = ex.ToString();
        }
    }

    private void ShowLoginError()
    {
        LoginError.Visible = true;
        LoginError.Text = "Invalid credentials";
    }

    protected void ForgetPasswordButton_Click(object sender, EventArgs e)
    {
        
        Response.Redirect("~/ForgetPassword.aspx");
    }

    protected void SignUpButton_Click(object sender, EventArgs e)
    {
       
        Response.Redirect("~/SignUp.aspx");
    }

    protected void LoginType_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}