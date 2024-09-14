using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Cart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["FirstName"] != null)
        {
            if (Session["AddedProductList"] != null)
            {
                string addedproductList = Session["AddedProductList"].ToString();
                if (addedproductList.Length > 0)
                {
                    string lastchar = addedproductList.Substring(addedproductList.Length - 1);
                    if (lastchar.Equals(","))
                    {
                        addedproductList = addedproductList.Remove(addedproductList.Length - 1);
                    }
                    string viewCartQuery = "Select  Product_Name, Product_Description, Product_Price FROM Product where Product_ID IN (" + addedproductList + ")";
                    ViewCartSource1.SelectCommand = viewCartQuery;
                }
                else
                {
                    Response.Redirect("EmptyCart.aspx");
                }
            }

        }
        else
        {
            Response.Redirect("LoginWarning.aspx");
        }

    }
}