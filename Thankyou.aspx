<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Thankyou.aspx.vb" Inherits="Thankyou" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Thankyou ,Your Order has been successfully placed with us.<br />
            Continue Shopping
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/HomePage.aspx">Home Page</asp:HyperLink>
        </div>
    </form>
</body>
</html>
