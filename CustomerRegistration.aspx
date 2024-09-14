<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CustomerRegistration.aspx.cs" Inherits="CustomerRegistration" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Customer Registration</title>
    <link href="~/Content/CustomerRegistration.css" rel="stylesheet" />
    <style>
       

html, body {
  height: 100%;
  margin: 0;
  background-color: #f5f5f5; 
}

.registration-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  height: 100vh;
  width: 100vw;
  background-color: #f5f5f5;
}

.registration-header {
  display: flex;
  justify-content: flex-start;
  align-items: center;
  width: 100%;
  background-color: #232f3e;
  padding: 10px 20px;
  color: #fff;
  box-sizing: border-box;
}

.registration-logo {
  color: #fff;
  font-size: 24px;
  font-weight: bold;
  text-decoration: none;
}

.container {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 20px;
  background-color: #fff;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  margin-top: 20px;
  border-radius: 8px;
  width: 50%;
  position: relative;
}

h2 {
  margin-bottom: 20px;
  color: #232f3e;
}

p {
  margin-bottom: 20px;
  color: #555;
}

.form-group {
  margin-bottom: 15px;
  width: 100%;
}

.form-group label {
  display: block;
  margin-bottom: 5px;
  color: #232f3e;
}

.form-group input {
  width: 100%;
  padding: 10px;
  border-radius: 4px;
  border: 1px solid #ccc;
}

.form-group input.error {
  border-color: #ff0000;
}

.error-message {
  color: #ff0000;
  margin-top: 5px;
}

.button-group {
  display: flex;
  justify-content: space-between;
  width: 103%;
}

.button-group button {
  padding: 10px 20px;
  border: none;
  margin-left: 10px;
  border-radius: 4px;
  cursor: pointer;
}

button[type="submit"] {
  background-color: #4caf50;
  color: #fff;
}

button[type="button"] {
  background-color: #f44336;
  color: #fff;
}

.back-button {
  position: absolute;
  top: 20px;
  left: 20px;
  background-color: #fe950b;
  color: #fff;
  padding: 10px 20px;
  border: none;
  border-radius: 4px;
  text-decoration: none;
  cursor: pointer;
}

.otp-container {
  display: flex;
  justify-content: space-between;
  width: 80%;
  margin: 20px 0;
}

.otp-container input {
  width: 60px;
  height: 60px;
  font-size: 24px;
  text-align: center;
  border-radius: 4px;
  border: 1px solid #ccc;
}

.register-button {
  padding: 10px 20px;
  background-color: #4caf50;
  border: none;
  border-radius: 4px;
  color: #fff;
  cursor: pointer;
  font-size: 16px;
  width: 100%;
}

        .button {
            margin-top: 0px;
        }
        .input {}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="registration-container">
            <div class="registration-header">
                <asp:HyperLink runat="server" NavigateUrl="~/" CssClass="registration-logo">Browse Bazar</asp:HyperLink>
            </div>
            <div class="container">
                <asp:HyperLink runat="server" NavigateUrl="~/" CssClass="back-button">Back</asp:HyperLink>
                <h2>Customer Registration</h2>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="error" />
                <asp:Panel ID="FormPanel" runat="server">
                    <div class="form-group">
                        <label>First Name</label>
                        <asp:TextBox ID="FirstName" runat="server" CssClass="input" />
                        <asp:RequiredFieldValidator ID="FirstNameRequired" runat="server" ControlToValidate="FirstName" ErrorMessage="First name is required" CssClass="error" />
                    </div>
                    <div class="form-group">
                        <label>Last Name</label>
                        <asp:TextBox ID="LastName" runat="server" CssClass="input" />
                        <asp:RequiredFieldValidator ID="LastNameRequired" runat="server" ControlToValidate="LastName" ErrorMessage="Last name is required" CssClass="error" />
                    </div>
                    <div class="form-group">
                        <label>Email Id</label>
                        <asp:TextBox ID="Email" runat="server" CssClass="input" TextMode="Email" />
                        <asp:RegularExpressionValidator ID="EmailValidator" runat="server" ControlToValidate="Email" ErrorMessage="Invalid email address" CssClass="error" ValidationExpression="^[^\s@]+@[^\s@]+\.[^\s@]+$" />
                        <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="Email is required" CssClass="error" />
                    </div>
                    <div class="form-group">
                        <label>Sex</label>
                        <asp:DropDownList ID="Sex" runat="server" CssClass="input">
                            <asp:ListItem Value="Male">Male</asp:ListItem>
                            <asp:ListItem Value="Female">Female</asp:ListItem>
                            <asp:ListItem Value="Other">Other</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label>Phone Number</label>
                        <asp:TextBox ID="PhoneNumber" runat="server" CssClass="input" />
                        <asp:RegularExpressionValidator ID="PhoneNumberValidator" runat="server" ControlToValidate="PhoneNumber" ErrorMessage="Phone number must be 10 digits" CssClass="error" ValidationExpression="^\d{10}$" />
                        <asp:RequiredFieldValidator ID="PhoneNumberRequired" runat="server" ControlToValidate="PhoneNumber" ErrorMessage="Phone number is required" CssClass="error" />
                    </div>
                    <div class="form-group">
                        <label>Address</label>
                        <asp:TextBox ID="Address" runat="server" CssClass="input" TextMode="MultiLine" Rows="4" />
                        <asp:RequiredFieldValidator ID="AddressRequired" runat="server" ControlToValidate="Address" ErrorMessage="Address is required" CssClass="error" />
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <asp:TextBox ID="Password" runat="server" CssClass="input" TextMode="Password" />
                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required" CssClass="error" />
                    </div>
                    <div class="form-group">
                        <label>Confirm Password</label>
                        <asp:TextBox ID="ConfirmPassword" runat="server" CssClass="input" TextMode="Password" />
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="ConfirmPassword" ControlToCompare="Password" ErrorMessage="Passwords do not match" CssClass="error" />
                    </div>
                    <asp:Button ID="RegisterButton" runat="server" Text="Register" OnClick="RegisterButton_Click" CssClass="register-button" />
                </asp:Panel>
                <asp:Panel ID="OtpPanel" runat="server" Visible="False">
                    <p>Please check your email</p>
                    <p>We've sent a code to <asp:Label ID="OtpEmail" runat="server" /></p>
                    <div class="otp-container">
                        <asp:TextBox ID="Otp1" runat="server" CssClass="otp-input" MaxLength="1" />
                        <asp:TextBox ID="Otp2" runat="server" CssClass="otp-input" MaxLength="1" />
                        <asp:TextBox ID="Otp3" runat="server" CssClass="otp-input" MaxLength="1" />
                        <asp:TextBox ID="Otp4" runat="server" CssClass="otp-input" MaxLength="1" />
                    </div>
                    <asp:Label ID="OtpErrorMessage" runat="server" CssClass="error-message" Visible="False" />
                    <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                    <div class="button-group">
                        <asp:Button ID="VerifyOtpButton" runat="server" Text="Verify OTP" OnClick="VerifyOtpButton_Click" CssClass="button" BackColor="#4CAF50" ForeColor="White" Height="41px" Width="160px" />
                        <asp:Button ID="CancelOtpButton" runat="server" Text="Cancel" OnClick="CancelOtpButton_Click" CssClass="button" Height="41px" Width="160px" />
                        <asp:Label ID="lblotp" runat="server" Text="Label" Visible="False"></asp:Label>
                    </div>
                   <p>Didn't get code? <asp:LinkButton ID="ResendOtpLinkButton" runat="server" OnClick="ResendOtpLinkButton_Click">Click to resend</asp:LinkButton>
                       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Browse_BazarConnectionString4 %>" ProviderName="<%$ ConnectionStrings:Browse_BazarConnectionString4.ProviderName %>" SelectCommand="SELECT * FROM [Customer]"></asp:SqlDataSource>
                    </p>
                </asp:Panel>
            </div>
        </div>
    </form>
</body>
</html>
