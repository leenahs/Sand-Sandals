using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;

namespace SandAndSandals
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["EShopConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void loginbtn_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("GetPassword", connection);

                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                SqlCommand select = new SqlCommand("select * from [User] where UserName=@UserName AND Password=@password", connection);

                select.Parameters.AddWithValue("@UserName", usernameinput.Value);
                select.Parameters.AddWithValue("@Password", passinput.Value);
                SqlDataAdapter sda = new SqlDataAdapter(select);
                DataTable result = new DataTable();
                sda.Fill(result);
                connection.Open();
                select.ExecuteNonQuery();
                connection.Close();
                if (result.Rows.Count > 0)
                {
                    Session["Login"] = result;
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FF0000");
                    Label1.Text = "Your username or email is incorrect";
                }
            }
        }
        private string hashPassword(string password)
        {
            SHA1CryptoServiceProvider sha1 = new SHA1CryptoServiceProvider();
            byte[] password_bytes = Encoding.ASCII.GetBytes(password);
            byte[] encrypted_bytes = sha1.ComputeHash(password_bytes);
            return Convert.ToBase64String(encrypted_bytes);
        }
    }
}
