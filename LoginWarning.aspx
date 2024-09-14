<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginWarning.aspx.cs" Inherits="LoginWarning" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Either you are not loged in or you are not authorized to view this page<br />
        </div>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Login</asp:HyperLink>
    </form>
</body>
</html>
