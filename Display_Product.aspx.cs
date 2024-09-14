using System;
using System.Web.UI.WebControls;

public partial class Display_Product : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void BuyButton_Command(object sender, CommandEventArgs e)
    {
        
        string productId = e.CommandArgument.ToString();

        
        Response.Redirect($"Purchase.aspx?productId={productId}");
    }
}
