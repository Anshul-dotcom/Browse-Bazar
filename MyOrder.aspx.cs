using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;



    public partial class MyOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateMainOrderIDs();
            }
        }

        protected void PopulateMainOrderIDs()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Browse_BazarConnectionString4"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
            SqlCommand cmd = new SqlCommand("SELECT DISTINCT MainOrderID FROM OrderDetails WHERE EmailID ='" + Session["EmailId"].ToString() + "'", conn);
            Label1.Text = "SELECT DISTINCT MainOrderID FROM OrderDetails WHERE EmailID ='" + Session["EmailId"].ToString() + "'";
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
               ddlOrderID.DataSource = reader;
                ddlOrderID.DataTextField = "MainOrderID";
                ddlOrderID.DataValueField = "MainOrderID";
                ddlOrderID.DataBind();

                
                ddlOrderID.Items.Insert(0, new ListItem("-- Select Order ID --", ""));
            }
        }

        protected void ddlOrderID_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(ddlOrderID.SelectedValue))
            {
                LoadOrderDetails();
            }
            else
            {
                ClearLabels();
            }
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
        Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void LoadOrderDetails()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Browse_BazarConnectionString4"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT EmailID, Name, MobileNumber, Address, OrderDate, PaymentMode " +
                               "FROM OrderDetails WHERE MainOrderID = @MainOrderID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@MainOrderID", ddlOrderID.SelectedValue);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    lblEmail.Text = "Email:" + reader["EmailID"].ToString();
                    lblOrderName.Text = "Order  " + reader["Name"].ToString();
                    lblPhone.Text = " " + reader["MobileNumber"].ToString();
                    lblOrderAddress.Text = " " + reader["Address"].ToString();
                    lblDate.Text = "Date: " + reader["OrderDate"].ToString();
                    lblAmount.Text = "Payment Mode: " + reader["PaymentMode"].ToString();
                }
            }
        }

        protected void ClearLabels()
        {
            lblEmail.Text = "";
            lblOrderName.Text = "";
            lblPhone.Text = "";
            lblOrderAddress.Text = "";
            lblDate.Text = "";
            lblAmount.Text = "";
        }
    }

