<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PlaceOrder.aspx.cs" Inherits="PlaceOrder" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Summary</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width: 60%; margin: auto; font-weight: bold; font-size: large;">
            <h2>Order Summary</h2>
            <hr />
            Email:<asp:Label ID="lblEmail" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label><br /><br />
            <asp:Label ID="lblName" runat="server" Text="Name:" Font-Bold="True" Font-Size="Large"></asp:Label><br /><br />
            <asp:Label ID="lblPhone" runat="server" Text="Phone: " Font-Bold="true" Font-Size="Large"></asp:Label><br /><br />
            <asp:Label ID="lblAddress" runat="server" Text="Address: " Font-Bold="true" Font-Size="Large"></asp:Label><br /><br />
            
            <hr />
             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="PlaceOrderSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
    <Columns>
        <asp:BoundField DataField="Product_Name" HeaderText="Product Name" SortExpression="Product_Name" />
        <asp:BoundField DataField="Product_Price" HeaderText="Product Price" SortExpression="Product_Price" />
        <asp:BoundField DataField="Product_ID" HeaderText="Product ID" Visible="False" />
    </Columns>
</asp:GridView>

            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Product_Id" DataSourceID="OrderDetailSource1" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" Visible="False">
                <Columns>
                    <asp:BoundField DataField="Product_Id" HeaderText="Product_Id" InsertVisible="False" ReadOnly="True" SortExpression="Product_Id" />
                    <asp:BoundField DataField="Product_Name" HeaderText="Product_Name" SortExpression="Product_Name" />
                    <asp:BoundField DataField="Product_Description" HeaderText="Product_Description" SortExpression="Product_Description" />
                    <asp:BoundField DataField="Product_Price" HeaderText="Product_Price" SortExpression="Product_Price" />
                    <asp:BoundField DataField="Product_Quantity" HeaderText="Product_Quantity" SortExpression="Product_Quantity" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="OrderDetailSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Browse_BazarConnectionString4 %>" ></asp:SqlDataSource>
            <asp:Label ID="Label3" runat="server" Text="Label" Visible="False"></asp:Label>
<asp:SqlDataSource ID="PlaceOrderSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:Browse_BazarConnectionString4 %>"
    SelectCommand="SELECT [Product_Name], [Product_Price], [Product_ID] FROM [Product] WHERE Product_ID IN (@AddedProductList)">
</asp:SqlDataSource>

            <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Label" Visible="False"></asp:Label>
            <asp:Label ID="lblTotalOrderValue" runat="server" Font-Bold="true" Font-Size="Large"></asp:Label><br /><br />
            <asp:Label ID="lblCOD" runat="server" Text="Only Cash on Delivery is Available" Font-Italic="true"></asp:Label><br /><br />
            <asp:Button ID="btnConfirmOrder" runat="server" Text="Confirm Order" OnClick="btnConfirmOrder_Click" BackColor="Green" ForeColor="White" Font-Bold="true" />
            <asp:Button ID="btnCancelOrder" runat="server" Text="Cancel Order" OnClick="btnCancelOrder_Click" BackColor="Red" ForeColor="White" Font-Bold="true" />
        </div>
    </form>
</body>
</html>
