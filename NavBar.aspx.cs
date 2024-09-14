using System;
using System.Web.UI;

public partial class NavBar : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      
        if (Session["UserName"] != null && Session["UserRole"] != null)
        {
           
            string userName = Session["UserName"].ToString();
            string userRole = Session["UserRole"].ToString();

            
            var liUserName = new System.Web.UI.HtmlControls.HtmlGenericControl("li");
            liUserName.InnerHtml = $"<span>{userName}</span>";

            
            RegistrationLink.Controls.Clear();
            LoginLink.Controls.Clear();

            
            ProfileLink.Controls.Add(liUserName);
        }
    }

    protected void Unnamed3_Click(object sender, EventArgs e)
    {

    }

    protected void Unnamed2_TextChanged(object sender, EventArgs e)
    {

    }
}
