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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("SELECT IdP, photoPath, PriceP, DesP FROM [Product]", new SqlConnection(ConfigurationManager.ConnectionStrings["EShopConnectionString"].ConnectionString));

            cmd.Connection.Open();
            Repeater1.DataSource = cmd.ExecuteReader();
            Repeater1.DataBind();
            cmd.Connection.Close();
            cmd.Connection.Dispose();

        }

    }
}