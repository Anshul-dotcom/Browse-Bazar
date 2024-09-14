<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyOrder.aspx.cs" Inherits="MyOrder" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Details</title>
    <style>
        .container {
            width: 80%;
            margin: 0 auto;
            border: 1px solid #ccc;
            padding: 20px;
            font-family: Arial, sans-serif;
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        .dropdown {
            margin-bottom: 20px;
            padding: 5px;
            width: 200px;
        }
        .refresh-btn {
            margin-left: 10px;
            padding: 5px 10px;
        }
        .label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }
        .gridview {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .gridview th, .gridview td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }
        .gridview th {
            background-color: #f2f2f2;
        }
    </style>
    <script type="text/javascript">
        function validateDropdown() {
            var ddl = document.getElementById('<%= ddlOrderID.ClientID %>');
            if (ddl.value === "") {
                alert("Please select an Order ID.");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" onsubmit="return validateDropdown();">
        <div class="container" style="color: #000000; font-weight: bold">
            <div class="header">
                <h2>Order Details</h2>
            </div>
            
            Select Order ID<br />
            
           
            <asp:DropDownList ID="ddlOrderID" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlOrderID_SelectedIndexChanged" CssClass="dropdown" DataTextField="MainOrderID" DataValueField="MainOrderID">
                
                <asp:ListItem Text="Select Order ID" Value="" />
            </asp:DropDownList>
            <asp:Button ID="btnRefresh" runat="server" Text="Refresh" OnClick="btnRefresh_Click" CssClass="refresh-btn" />

           
            <asp:Label ID="lblEmail" runat="server" CssClass="label"></asp:Label><br />
            <asp:Label ID="lblOrderName" runat="server" CssClass="label"></asp:Label><br />
            <asp:Label ID="lblPhone" runat="server" CssClass="label"></asp:Label>
            <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
            <br />
            <asp:Label ID="lblOrderAddress" runat="server" CssClass="label"></asp:Label><br />
            <asp:Label ID="lblDate" runat="server" CssClass="label"></asp:Label><br />
            <asp:Label ID="lblAmount" runat="server" CssClass="label"></asp:Label><br />
            
            
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="gridview" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                    <asp:BoundField DataField="ProductAmount" HeaderText="Product Amount" />
                    <asp:BoundField DataField="Name" HeaderText="Seller Name" />
                    <asp:BoundField DataField="Address" HeaderText="Seller Address" />
                </Columns>
            </asp:GridView>

            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:Browse_BazarConnectionString4 %>" 
                SelectCommand="SELECT EmailID, Name, MobileNumber, Address, ProductName, ProductAmount, OrderDate, PaymentMode 
                               FROM OrderDetails 
                               WHERE MainOrderID = @MainOrderID">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlOrderID" Name="MainOrderID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>