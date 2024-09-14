<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateProduct.aspx.cs" Inherits="UpdateProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="UpdateSource1" AutoGenerateColumns="False" DataKeyNames="Product_Id">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Product_Id" HeaderText="Product_Id" InsertVisible="False" ReadOnly="True" SortExpression="Product_Id" />
                <asp:BoundField DataField="Product_Name" HeaderText="Product_Name" SortExpression="Product_Name" />
                <asp:BoundField DataField="Product_Description" HeaderText="Product_Description" SortExpression="Product_Description" />
                <asp:BoundField DataField="Product_Price" HeaderText="Product_Price" SortExpression="Product_Price" />
                <asp:BoundField DataField="Product_Quantity" HeaderText="Product_Quantity" SortExpression="Product_Quantity" />
                <asp:BoundField DataField="Product_Category" HeaderText="Product_Category" SortExpression="Product_Category" />
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
         <asp:SqlDataSource 
    ID="UpdateSource1" 
    runat="server" 
    ConnectionString="<%$ ConnectionStrings:Browse_BazarConnectionString4 %>" 
    SelectCommand="SELECT [Product_Id], [Product_Name], [Product_Price], [Product_Quantity], [Product_Category], [Product_Description] FROM [Product] WHERE [Seller_Email_Id] = @EmailId" 
    UpdateCommand="UPDATE Product SET Product_Name = @Product_Name, Product_Description = @Product_Description, Product_Price = @Product_Price, Product_Category = @Product_Category, Product_Quantity = @Product_Quantity WHERE Product_Id = @Product_Id" 
    DeleteCommand="DELETE FROM Product WHERE Product_Id = @Product_Id">

    <SelectParameters>
        <asp:SessionParameter Name="EmailId" SessionField="EmailId" Type="String" />
    </SelectParameters>

    <UpdateParameters>
        <asp:Parameter Name="Product_Name" Type="String" />
        <asp:Parameter Name="Product_Description" Type="String" />
        <asp:Parameter Name="Product_Price" Type="Int32" />
        <asp:Parameter Name="Product_Category" Type="String" />
        <asp:Parameter Name="Product_Quantity" Type="Int32" />
        <asp:Parameter Name="Product_Id" Type="Int32" />
    </UpdateParameters>

    <DeleteParameters>
        <asp:Parameter Name="Product_Id" Type="Int32" />
    </DeleteParameters>
</asp:SqlDataSource>

    </form>
</body>
</html>