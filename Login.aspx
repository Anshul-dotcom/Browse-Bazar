<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - Browse Bazar</title>
    <link rel="stylesheet" type="text/css" href="styles/Login.css" />
    <style>
        
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f5f5f5;
}

.login-page {
    display: flex;
    flex-direction: column;
    align-items: center;
    min-height: 100vh;
    width: 100vw;
    background-color: #f5f5f5;
}

.login-header {
    display: flex;
    justify-content: flex-start;
    align-items: center;
    width: 100%;
    background-color: #232f3e;
    padding: 10px 20px;
    color: #fff;
    box-sizing: border-box;
}

.website-name {
    color: #fff;
    font-size: 24px;
    font-weight: bold;
    text-decoration: none;
    margin-left: 20px;
}

.login-container {
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

.back-button {
    position: absolute;
    top: 10px;
    left: 10px;
    text-decoration: none;
    color: #232f3e;
    font-size: 16px;
    font-weight: bold;
    background-color: #ffc107;
    padding: 10px 20px;
    border-radius: 4px;
    border: none;
    cursor: pointer;
}

.form-group {
    margin-bottom: 15px;
    width: 100%;
}

label {
    display: block;
    margin-bottom: 5px;
}

input, select {
    width: 100%;
    padding: 10px;
    border-radius: 4px;
    border: 1px solid #ccc;
}

.login-button {
    width: 100%;
    padding: 10px;
    background-color: #28a745;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    margin-top: 10px;
    text-align: center;
}

.forget-password-button,
.sign-up-button {
    width: 100%;
    padding: 10px;
    background-color: #dc3545;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    margin-top: 10px;
    text-align: center;
}

.forget-password-button:hover,
.sign-up-button:hover,
.login-button:hover {
    opacity: 0.8;
}

.error-message {
    color: red;
    margin-top: 10px;
}


    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-page">
            <header class="login-header">
                <a href="/" class="website-name">Browse Bazar</a>
            </header>
            <div class="login-container">
                <a href="/" class="back-button">Back</a>
                <h2>Login Page</h2>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="error-message" />
                <div class="form-group">
                    <asp:Label ID="UserIdLabel" runat="server" AssociatedControlID="UserId" Text="User ID:" />
                    <asp:TextBox ID="UserId" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="UserIdRequired" runat="server" ControlToValidate="UserId" ErrorMessage="User ID is required." CssClass="error-message" />
                </div>
                <div class="form-group">
                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" Text="Password:" />
                    <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." CssClass="error-message" />
                </div>
                <div class="form-group">
                    <asp:Label ID="LoginError" runat="server" Text="Label" Visible="False"></asp:Label>
                    <asp:Label ID="LoginTypeLabel" runat="server" AssociatedControlID="LoginType" Text="Choose Login:" />
                    <asp:DropDownList ID="LoginType" runat="server" CssClass="form-control" OnSelectedIndexChanged="LoginType_SelectedIndexChanged">
                        <asp:ListItem Value="Admin">Admin</asp:ListItem>
                        <asp:ListItem Value="Customer">Customer</asp:ListItem>
                        <asp:ListItem Value="Seller">Seller</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <asp:Button ID="LoginButton" runat="server" CssClass="login-button" Text="Login" OnClick="LoginButton_Click" />
                <asp:Button ID="ForgetPasswordButton" runat="server" CssClass="forget-password-button" Text="Forget Password" OnClick="ForgetPasswordButton_Click" />
                <asp:Button ID="SignUpButton" runat="server" CssClass="sign-up-button" Text="Sign Up" OnClick="SignUpButton_Click" />
            </div>
        </div>
    </form>
</body>
</html>
