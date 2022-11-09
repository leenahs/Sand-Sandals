using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace SandAndSandals
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["EShopConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Login"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    if (Session["Shopping"] != null)
                    {
                        DataTable saveitems = (DataTable)Session["Shopping"];

                        if (saveitems.Rows.Count > 0)
                        {
                            ListView1.DataSource = saveitems;
                            ListView1.DataBind();
                        }
                    }
                }
            }
        }
    }
}