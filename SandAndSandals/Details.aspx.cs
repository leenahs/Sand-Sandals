using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Configuration;

namespace SandAndSandals
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EShopConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["IdP"] != null)
                {
                    if (Request.QueryString["IdP"] != null)
                    {
                        string IdP = Request.QueryString["IdP"].ToString();

                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = new SqlCommand("SELECT * FROM Product WHERE IdP = '" + IdP + "' ", con);
                        DataTable dt = new DataTable();

                        da.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            PhotoP.ImageUrl = dt.Rows[0]["photoPath"].ToString();
                            proDes.InnerText = dt.Rows[0]["DesP"].ToString();
                            Proprice.InnerText = dt.Rows[0]["PriceP"].ToString();
                            proquantity.InnerText = dt.Rows[0]["QtyP"].ToString();
                        }
                    }
                }
                else
                {
                    Response.Redirect("ProductPage.aspx");
                }
            }
        }

        protected void AddToCartbtn_Click(object sender, EventArgs e)
        {
            if (Session["Login"] != null)
            {
                if (Session["Shopping"] == null)
                {
                    DataTable NewTable = new DataTable();
                    NewTable.Columns.Add("IdP");
                    NewTable.Columns.Add("PhotoPath");
                    NewTable.Columns.Add("DesP");
                    NewTable.Columns.Add("PriceP");
                    NewTable.Columns.Add("QtyP");
                    
                    Session["Shopping"] = NewTable;
                }

                DataTable Shopping = (DataTable)Session["Shopping"];

                Shopping.Rows.Add(Request.QueryString["IdP"],
                    PhotoP.ImageUrl, 
                    proDes.InnerText,
                    Proprice.InnerText,
                    userSelected.Value);
                    Session["Shopping"] = Shopping;
                    Response.Redirect("ProductPage.aspx"); 
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}