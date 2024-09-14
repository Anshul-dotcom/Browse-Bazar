using System;
using System.Web.UI.WebControls;

public partial class View_Product : System.Web.UI.Page
{
    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
       
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }

    protected void Unnamed2_TextChanged(object sender, EventArgs e)
    {
        
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Type"] == "Seller")
        {
            lblProfile.Text = "Welcome Seller " + Session["FirstName"];
        }
        else
        {
            Response.Redirect("LoginWarning.aspx");
        }

        if (!IsPostBack)
        {
            ddlPriceRange.SelectedIndex = 0; 
        }
    }

    protected void ddlPriceRange_SelectedIndexChanged(object sender, EventArgs e)
    {
      /*  string selectedPriceRange = ddlPriceRange.SelectedValue;

        // Example: Implement filtering logic based on selected price range
        switch (selectedPriceRange)
        {
            case "0-50":
                // Filter products priced between $0 and $50
                break;
            case "51-100":
                // Filter products priced between $51 and $100
                break;
            case "101-200":
                // Filter products priced between $101 and $200
                break;
            case "201-500":
                // Filter products priced between $201 and $500
                break;
            case "500+":
                // Filter products priced above $500
                break;
        }*/

        // Rebind your GridView to reflect the filtered data
        // GridView1.DataBind();
    }

   

    protected void ListView1_RowCommand(object sender, ListViewCommandEventArgs e)
    {
        Label1.Text = "Inside before add to cart";

        if (e.CommandName == "AddToCart" || e.CommandName == "BuyNow")
        {
            Label1.Text = "Inside add to cart";
            int productId = Convert.ToInt32(e.CommandArgument);
            if (Session["FirstName"] == null)
            {
                Response.Redirect("LoginWarning.aspx");
                
            }
            else
            {
                ButtonProdList.Text = productId.ToString() + "," + ButtonProdList.Text;

            }
        }

    }

    protected void ViewCart_Click(object sender, EventArgs e)
    {
        Session["AddedProductList"] = ButtonProdList.Text;
        Response.Redirect("View_Cart.aspx");
    }
}
