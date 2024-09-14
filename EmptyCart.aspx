<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EmptyCart.aspx.cs" Inherits="EmptyCart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            your cart is empty

        </div>
        <asp:HyperLink runat="server" NavigateUrl="~/ViewProduct.aspx" Text="View Product" />
    </form>
</body>
</html>
