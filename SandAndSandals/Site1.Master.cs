using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SandAndSandals
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Login"] != null)
                {
                    LogoutLink.Visible = true;
                }
                else
                {
                    LogoutLink.Visible = false;
                }

            }
        }

        protected void LogOutLink_Click(object sender, EventArgs e)
        {
            // clear login and cart session
            Session["Login"] = null;
            Session["Shopping"] = null;
        }
    }
}