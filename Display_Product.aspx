<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Display_Product.aspx.cs" Inherits="Display_Product" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
    <style>
        body {
    font-family: Arial, sans-serif;
}
 
.container {
    width: 80%;
    margin: 0 auto;
}
 
h1 {
    text-align: center;
    margin-bottom: 20px;
}
 
.product-grid {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    gap: 16px; 
}
 
.product-item {
    border: 1px solid #ccc;
    border-radius: 5px;
    padding: 16px;
    width: calc(33.333% - 20px); 
    box-sizing: border-box;
    text-align: center;
    transition: box-shadow 0.3s ease-in-out;
    margin-bottom: 16px; 
}
 
    .product-item:hover {
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
 
    .product-item img {
        max-width: 100%;
        height: auto;
        margin-bottom: 15px;
    }
 
    .product-item h2 {
        font-size: 1.5em;
        margin: 0.5em 0;
        color: #333;
    }
 
    .product-item p {
        color: #666;
        font-size: 0.9em;
        margin-bottom: 15px;
    }
 
    .product-item .price {
        font-size: 1.2em;
        color: #e67e22;
        margin-top: 1em;
        display: block;
    }
 
.buy-button {
    background-color: #28a745;
    color: white;
    border: none;
    padding: 10px 20px;
    cursor: pointer;
    font-size: 1em;
    transition: background-color 0.3s ease-in-out;
}
 
    .buy-button:hover {
        background-color: #218838;
    }

has context menu
    </style>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ListView ID="ListView1" runat="server">
<LayoutTemplate>
<div class="product-grid">
<asp:PlaceHolder runat="server" ID="itemPlaceholder" />
</div>
</LayoutTemplate>
<ItemTemplate>
<div class="product-item">
<img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Name") %>' class="product-image" />
<h2 class="product-name"><%# Eval("Name") %></h2>
<p class="product-description"><%# Eval("Description") %></p>
<span class="product-price">$<%# Eval("Price") %></span><asp:Button ID="BuyButton" runat="server" Text="Buy Now" CommandName="Buy" CommandArgument='<%# Eval("Id") %>' CssClass="buy-button" OnCommand="BuyButton_Command" />
</div>
</ItemTemplate>
</asp:ListView>

        </div>
    </form>

</body>
</html>
