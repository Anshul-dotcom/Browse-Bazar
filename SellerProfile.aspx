<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SellerProfile.aspx.cs" Inherits="SellerProfile" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seller Profile</title>
    <link rel="stylesheet" href="Styles.css">
    <style>
                       .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #232f3e;
            padding: 10px 20px;
            color: #d70505;
            width: 100vw;
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
            background-color: #d70505;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            width: 100px;
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
            color: #fff;
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
        #sidebar {
    width: 250px;
    background-color: #f8f9fa;
    padding: 15px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    position: fixed;
    top: 80px; 
    left: 0;
    height: 100%;
    box-sizing: border-box;
    z-index: 1;
}

#sidebar .btn {
    display: block;
    width: 100%;
    padding: 10px 15px;
    margin-bottom: 20px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    text-align: center;
    font-size: 16px;
}

#sidebar .btn:hover {
    background-color: #0056b3;
}

#sidebar .category-list {
    list-style: none;
    padding: 0;
    margin: 0;
}

#sidebar .category-list li {
    margin-bottom: 15px;
}

#sidebar .category-list select {
    width: 100%;
    padding: 8px 10px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.product-grid {
    margin-left: 270px; 
    padding: 20px;
}
.price-range-filter {
    margin-top: 20px;
}

.price-range-filter h4 {
    margin-bottom: 10px;
    color: #343a40;
}

.price-input {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ced4da;
    border-radius: 4px;
}

.filter-button {
    width: 100%;
    padding: 10px;
    background-color: #28a745;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}



        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 20px;
            padding: 20px;
            background-color: #f9f9f9;
        }

        .product-card {
            background-color: #fff;
            border: 1px solid #e0e0e0;
            border-radius: 10px;
            padding: 20px;
            text-align: center;
            transition: box-shadow 0.3s;
        }

        .product-card:hover {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .product-image {
            max-width: 100%;
            height: auto;
            margin-bottom: 15px;
        }

        .product-name {
            font-size: 18px;
            color: #333;
            margin: 10px 0;
            font-weight: bold;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }

        .product-price {
            font-size: 16px;
            color: #388e3c;
            margin-bottom: 15px;
            font-weight: bold;
        }
         label {
  display: block;
  margin-bottom: 5px;
  color: #232f3e;
}

        .add-to-cart-button,
        .buy-now-button {
            display: block;
            width: 100%;
            padding: 10px;
            font-size: 14px;
            margin-bottom: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .add-to-cart-button {
            background-color: #ff9800;
            color: #fff;
        }

        .add-to-cart-button:hover {
            background-color: #fb8c00;
        }

        .buy-now-button {
            background-color: #388e3c;
            color: #fff;
        }

        .buy-now-button:hover {
            background-color: #2e7d32;
        }

        .no-products {
            text-align: center;
            padding: 20px;
            font-size: 18px;
            color: #757575;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="home-page">
           
            <nav class="navbar">
                <div class="navbar-logo">
                    <asp:HyperLink runat="server" NavigateUrl="~/" Text="Browse Bazar" />
                </div>
                <div class="navbar-search">
                    <asp:TextBox runat="server" CssClass="search-input" Placeholder="Search for products, brands and more" OnTextChanged="Unnamed2_TextChanged" />
                    <asp:Button runat="server" Text="Search" CssClass="search-button" />
                </div>
                <div class="navbar-links">
                    <ul>
                        <li><asp:HyperLink runat="server" NavigateUrl="~/" Text="Home" /></li>
                        <li><asp:HyperLink runat="server" NavigateUrl="~/" Text="Deals" /></li>
                        <li><asp:HyperLink runat="server" NavigateUrl="~/" Text="Orders" /></li>
                        <li><asp:HyperLink runat="server" NavigateUrl="~/" Text="Cart" /></li>
                        <li class="dropdown">
                            <asp:Label ID="lblProfile" runat="server" ForeColor="White" CssClass="dropdown-toggle" />
                            <div class="dropdown-content">
                                <asp:HyperLink runat="server" NavigateUrl="~/AddProduct.aspx" Text="Add Product" />
                                <asp:HyperLink runat="server" NavigateUrl="~/UpdateProduct.aspx" Text="Update Product" />
                                <asp:HyperLink runat="server" NavigateUrl="~/MyOrder.aspx" Text="My Order" />
                                <asp:HyperLink runat="server" NavigateUrl="~/HomePage.aspx" Text="Log Out" />
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
           
                         <div id="sidebar">
           
    <ul class="category-list">
        <label>Select Category<asp:Button ID="ViewCart" runat="server" OnClick="ViewCart_Click" Text="View Cart" />
        </label>
        &nbsp;<li>
            <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
                <asp:ListItem Value="All" Text="All Categories" />
                <asp:ListItem Value="Cosmetic" Text="Cosmetic" />
                <asp:ListItem Value="Electronic" Text="Electronic" />
                <asp:ListItem Value="Groceries" Text="Groceries" />
            </asp:DropDownList>
        </li>
        <li>
            <label>Select Price</label>
            <asp:DropDownList ID="ddlPriceRange" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPriceRange_SelectedIndexChanged">
                <asp:ListItem Value="0-50" Text="0 - 50" />
                <asp:ListItem Value="51-100" Text="51 - 100" />
                <asp:ListItem Value="101-200" Text="101 - 200" />
                <asp:ListItem Value="201-500" Text="201 - 500" />
                <asp:ListItem Value="500+" Text="500+" />
            </asp:DropDownList>
        </li>
    </ul>
</div>



        
        <asp:Button ID="ButtonProdList" runat="server" Height="105px" Visible="False" />



        
        <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>



        
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="Product_ID" DataSourceID="View_ProductDataSource1" OnItemCommand="ListView1_RowCommand">
            <LayoutTemplate>
                <div class="product-grid">
                    <asp:PlaceHolder runat="server" ID="itemPlaceholder" />
                </div>
            </LayoutTemplate>

            <ItemTemplate>
                <div class="product-card">
                    <h2 class="product-name"><%# Eval("Product_Name") %></h2>
                    <asp:Image ID="Image1" runat="server" CssClass="product-image" 
                        ImageUrl='<%# ResolveUrl("~/ProductImages/" + Eval("Product_Image_Path")) %>' 
                        AlternateText='<%# Eval("Product_Name") %>' />
                    <p class="product-price">Amount : <%# Eval("Product_Price") %></p>
                    <h4 class="product-description"><%# Eval("Product_Description") %></h4>
                    <asp:Button ID="AddToCartButton" runat="server" Text="Add to Cart" CommandName="AddToCart" 
                        CommandArgument='<%# Eval("Product_Id") %>' CssClass="add-to-cart-button" />
                    <asp:Button ID="BuyNowButton" runat="server" Text="Buy Now" CommandName="BuyNow" 
                        CommandArgument='<%# Eval("Product_Id") %>' CssClass="buy-now-button" />
                </div>
            </ItemTemplate>

            <EmptyDataTemplate>
                <div class="no-products">
                    <p>No products available.</p>
                </div>
            </EmptyDataTemplate>
        </asp:ListView>


        <asp:SqlDataSource 
            ID="View_ProductDataSource1" 
            runat="server" 
            ConnectionString="<%$ ConnectionStrings:Browse_BazarConnectionString4 %>" 
            SelectCommand="SELECT [Product_Name], [Product_Id], [Product_Description], [Product_Price], [Product_Quantity], [Product_Category],[Product_Image_Path] FROM [Product] WHERE ([Product_Category] = @Product_Category OR @Product_Category = 'All' AND Product_Quantity > 0)"
            DeleteCommand="DELETE FROM [Product] WHERE [Product_Id] = @Product_Id"
            UpdateCommand="UPDATE [Product] SET 
                [Product_Name] = @Product_Name, 
                [Product_Description] = @Product_Description, 
                [Product_Price] = @Product_Price, 
                [Product_Quantity] = @Product_Quantity, 
                [Product_Category] = @Product_Category 
                WHERE [Product_Id] = @Product_Id">
            <SelectParameters>
                <asp:ControlParameter Name="Product_Category" ControlID="ddlCategory" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="Product_Id" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Product_Name" Type="String" />
                <asp:Parameter Name="Product_Description" Type="String" />
                <asp:Parameter Name="Product_Price" Type="Decimal" />
                <asp:Parameter Name="Product_Quantity" Type="Int32" />
                <asp:Parameter Name="Product_Category" Type="String" />
                <asp:Parameter Name="Product_Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>