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
    public partial class WebForm6 : System.Web.UI.Page
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
        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            if (Session["Shopping"] != null && Session["Login"] != null)
            {
                // Get the user and items from the cart session to insert them to the ShoppingCart table
                DataTable Shopping = (DataTable)Session["Shopping"];
                DataTable userdata = (DataTable)Session["Login"];
                string UserID = userdata.Rows[0]["Uid"].ToString();

                DateTime OrderDate = DateTime.Now;

                SqlCommand newOrder = new SqlCommand("insert into [ShopCart] (UId,OrderDate) values('" + UserID + "','" + OrderDate + "') ", connection);
                connection.Open();
                newOrder.ExecuteNonQuery();
                SqlDataAdapter ad = new SqlDataAdapter();

                // after inserting the order, now we need to get the last oder to add it to the orderdetail table
                ad.SelectCommand = new SqlCommand("Select * from [ShopCart] where OrderID=(Select Max(OrderID) from [ShopCart])", connection);
                DataTable dt = new DataTable();
                ad.Fill(dt);
                string orderid = "";
                if (dt.Rows.Count > 0)
                {
                    // now we have the last order in the order table 
                    orderid = dt.Rows[0]["OrderID"].ToString();
                }

                for (int j = 0; j < Shopping.Rows.Count; j++)
                {
                    // here we update the quantity in the database after the user ordered.
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = new SqlCommand("Select * from [Product] where IdP='" + Shopping.Rows[j]["IdP"] + "'", connection);
                    DataTable data = new DataTable();
                    da.Fill(data);
                    if (data.Rows.Count > 0)
                    {
                        // here we take the quantity from the database and minuse from the user quantity
                        int updatequantity = int.Parse(data.Rows[0]["QtyP"].ToString()) - int.Parse(Shopping.Rows[j]["QtyP"].ToString());
                        SqlCommand newquantity = new SqlCommand("update [Product] set QtyP='" + updatequantity + "'   where IdP='" + Shopping.Rows[j]["IdP"] + "' ", connection);
                        newquantity.ExecuteNonQuery();
                    }
                    //insert into orderdetails
                    SqlCommand productdetails = new SqlCommand("insert into [DetailsOrder](OrderID,IdP,QtyOrder) " +
                        "values('" + orderid + "','" + Shopping.Rows[j]["IdP"] + "','" + Shopping.Rows[j]["QtyP"] + "')", connection);
                    productdetails.ExecuteNonQuery();
                    orderPlacedLabel.ForeColor = System.Drawing.Color.Green;
                    orderPlacedLabel.Text = "Your order has been placed successfully.";
                }
                connection.Close();
                // clear shopping cart
                Session["Shopping"] = null;
            }
        }
    }
}