<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddProduct.aspx.cs" Inherits="AddProduct" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product</title>
    <link href="~/Content/SellerRegistration.css" rel="stylesheet" />
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        .form-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: #fff;
           position: relative;
            padding: 20px;
            border-radius: 8px;
           width: 50%;
            margin: 50px auto;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            margin-bottom: 20px;
            color: #232f3e;
        }

        table {
            width: 100%;
        }

        td {
            padding: 10px;
            vertical-align: top;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #232f3e;
        }

        input[type="text"],
        input[type="file"],
        select {
            width: calc(100% - 22px);
            padding: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        button {
            padding: 10px 20px;
            border: none;
            margin-top: 10px;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            box-sizing: border-box;
        }

        button[type="submit"] {
            background-color: #4caf50;
            color: #fff;
        }

        button[type="button"] {
            background-color: #f44336;
            color: #fff;
        }

        .header-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
            background-color: #232f3e;
            padding: 10px 20px;
            color: #fff;
            box-sizing: border-box;
        }

        .header-logo {
            color: #fff;
            font-size: 24px;
            font-weight: bold;
            text-decoration: none;
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header-container">
            <asp:HyperLink runat="server" NavigateUrl="~/" CssClass="header-logo">Browse Bazar</asp:HyperLink>
           
        </div>
        <div class="form-container">
            <asp:HyperLink runat="server" NavigateUrl="~/" CssClass="back-button">Back</asp:HyperLink>
            <h1>Add Product</h1>
            <table>
                <tr>
                    <td><label>Seller Name:</label></td>
                    <td><asp:Label ID="lblSellerName" runat="server" Text="Unknown Seller" /></td>
                </tr>
                <tr>
                    <td><label>Product Name:</label></td>
                    <td><asp:TextBox ID="txtProductName" runat="server" /></td>
                </tr>
                <tr>
                    <td>Product Description:</td>
                    <td><asp:TextBox ID="txtProductDescription" runat="server" /></td>
                </tr>
                <tr>
                    <td><label>Product Price:</label></td>
                    <td><asp:TextBox ID="txtProductPrice" runat="server" /></td>
                </tr>
                <tr>
                    <td><label>Product Quantity:</label></td>
                    <td><asp:TextBox ID="txtProductQty" runat="server" /></td>
                </tr>
                <tr>
                    <td><label>Category:</label></td>
                    <td>
                        <asp:DropDownList ID="ddlCategory" runat="server">
                            <asp:ListItem>Cosmetic</asp:ListItem>
                            <asp:ListItem>Electronic</asp:ListItem>
                            <asp:ListItem>Groceries</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td><label>Product Image:</label></td>
                    <td><asp:FileUpload ID="fulProductImage" runat="server" /></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button type="submit" runat="server" id="btnAddProduct" onserverclick="btnAddProduct_Click">Add Product</button>
                        <button type="button" runat="server" id="btnClearFields" onserverclick="btnClearFields_Click">Clear Fields</button>
                        <asp:Label ID="lblErrorMessage" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
