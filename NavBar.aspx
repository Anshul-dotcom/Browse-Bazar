<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NavBar.aspx.cs" Inherits="NavBar" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Browse Bazar</title>
    <link href="~/Content/NavBar.css" rel="stylesheet" />
    <style>
       
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #232f3e;
            padding: 10px 20px;
            color: #d70505;
            width: 100%;
            box-sizing: border-box;
        }

        .navbar-logo {
            flex: 1;
        }

        .navbar-logo a {
            color: #fff;
            font-size: 24px;
            font-weight: bold;
            text-decoration: none;
        }

        .navbar-search {
            display: flex;
            align-items: center;
            flex: 2;
        }

        .navbar-search input {
            padding: 10px;
            border-radius: 4px;
            border: none;
            width: 100%;
        }

        .navbar-search button {
            padding: 10px;
            background-color: #513e25;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            width: 100px;
            margin-top: 0px;
            margin-left: 10px;
        }

        .navbar-links {
            flex: 3;
        }

        .navbar-links ul {
            list-style: none;
            display: flex;
            justify-content: space-around;
            align-items: center;
            margin: 0;
            padding: 0;
        }

        .navbar-links ul li {
            position: relative;
        }

        .navbar-links ul li a,
        .navbar-links ul li span {
            color: #fff;
            text-decoration: none;
            cursor: pointer;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #232f3e;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }

        .dropdown-content a {
            color: rgb(14, 13, 13);
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .dropdown-content a:hover {
            background-color: #021d3d;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar">
            <div class="navbar-logo">
                <asp:HyperLink runat="server" NavigateUrl="~/" Text="Browse Bazar" />
            </div>
            <div class="navbar-search">
                <asp:TextBox runat="server" CssClass="search-input" Placeholder="Search for products, brands and more" OnTextChanged="Unnamed2_TextChanged" />
                <asp:Button runat="server" Text="Search" CssClass="search-button" OnClick="Unnamed3_Click" />
            </div>
            <div class="navbar-links">
                <ul>
                    <li><asp:HyperLink runat="server" NavigateUrl="~/" Text="Home" /></li>
                    <asp:PlaceHolder runat="server" ID="RegistrationLink">
                        <li class="dropdown">
                            <span>Registration</span>
                            <div class="dropdown-content">
                                <asp:HyperLink runat="server" NavigateUrl="~/SellerRegistration.aspx" Text="Seller Registration" />
                                <asp:HyperLink runat="server" NavigateUrl="~/CustomerRegistration.aspx" Text="Customer Registration" />
                                <asp:HyperLink runat="server" NavigateUrl="~/AdminRegistration.aspx" Text="Admin Registration" />
                            </div>
                        </li>
                    </asp:PlaceHolder>
                    <li><asp:HyperLink runat="server" NavigateUrl="~/" Text="Deals" /></li>
                    <li><asp:HyperLink runat="server" NavigateUrl="~/" Text="Orders" /></li>
                    <li><asp:HyperLink runat="server" NavigateUrl="~/" Text="Cart" /></li>
                    <asp:PlaceHolder runat="server" ID="LoginLink">
                        <li><asp:HyperLink runat="server" NavigateUrl="~/Login.aspx" Text="Login" /></li>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder runat="server" ID="ProfileLink">
                        
                    </asp:PlaceHolder>
                </ul>
            </div>
        </nav>
    </form>
</body>
</html>
