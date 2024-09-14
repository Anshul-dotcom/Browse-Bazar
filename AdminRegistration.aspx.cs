using System;
using System.Net.Mail;
using System.Net;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class AdminRegistration : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void RegisterButton_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            GenerateAndSendOtp();
        }
    }

    protected void CancelOtpButton_Click(object sender, EventArgs e)
    {
        FormPanel.Visible = true;
        OtpPanel.Visible = false;

        Otp1.Text = "";
        Otp2.Text = "";
        Otp3.Text = "";
        Otp4.Text = "";
    }

    protected void VerifyOtpButton_Click(object sender, EventArgs e)
    {
        string enteredOtp = Otp1.Text + Otp2.Text + Otp3.Text + Otp4.Text;

        if (enteredOtp == lblotp.Text)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Browse_BazarConnectionString4"].ConnectionString;
            string email = Email.Text.Trim();
            string firstName = FirstName.Text.Trim();
            string lastName = LastName.Text.Trim();
            string password = Label1.Text;
            Label1.Visible = false;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
               

              
                string query = "INSERT INTO Admin (EmailId, FirstName, LastName, Password,Type) " +
                               "VALUES (@EmailId, @FirstName, @LastName, @Password,@Type)";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@EmailId", email);
                    command.Parameters.AddWithValue("@FirstName", firstName);
                    command.Parameters.AddWithValue("@LastName", lastName);
                    command.Parameters.AddWithValue("@Password", password);
                    command.Parameters.AddWithValue("@Type", "Admin");
                   

                    try
                    {
                        connection.Open();
                        command.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        Label1.Visible = true;
                        Label1.Text = ex.Message + ex.StackTrace + ex.ToString();
                        
                    }
                }
            }
        }
        else
        {
            OtpErrorMessage.Text = "Invalid OTP. Please try again.";
            OtpErrorMessage.ForeColor = System.Drawing.Color.Red;
            OtpErrorMessage.Visible = true;
        }
    }

    protected void ResendOtpLinkButton_Click(object sender, EventArgs e)
    {
        GenerateAndSendOtp();
    }

    private void GenerateAndSendOtp()
    {
        Random otpGenerator = new Random();
        lblotp.Text = otpGenerator.Next(1000, 9999).ToString();

        try
        {
            string senderEmail = "noreply.shoppers.choice@gmail.com";
            string senderPassword = "lujg qath oqjc sjtk";
            string senderName = "Browse Bazar Admin";
            string recipientEmail = Email.Text;
            Label1.Text = Password.Text;
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress(senderEmail, senderName);
            mail.To.Add(new MailAddress(recipientEmail));
            mail.Subject = "OTP for Admin Registration";
            mail.Body = $"Dear {FirstName.Text},\n\nYour OTP for Admin registration is {lblotp.Text}.\n\nThank you,\nBrowse Bazar Admin";

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

        FormPanel.Visible = false;
        OtpPanel.Visible = true;
        OtpEmail.Text = Email.Text;
    }
}
