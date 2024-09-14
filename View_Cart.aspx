<%@ Page Language="C#" AutoEventWireup="true" CodeFile="View_Cart.aspx.cs" Inherits="View_Cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ViewCartSource1">
            <Columns>
                <asp:BoundField DataField="Product_Name" HeaderText="Product_Name" SortExpression="Product_Name" />
                <asp:BoundField DataField="Product_Description" HeaderText="Product_Description" SortExpression="Product_Description" />
                <asp:BoundField DataField="Product_Price" HeaderText="Product_Price" SortExpression="Product_Price" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="ViewCartSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Browse_BazarConnectionString4 %>" SelectCommand="SELECT [Product_Name], [Product_Description], [Product_Price] FROM [Product]"></asp:SqlDataSource>
        <asp:HyperLink ID="checkout" runat="server" NavigateUrl="~/PlaceOrder.aspx">Proceed to checkout</asp:HyperLink>
    </form>
</body>
</html>
