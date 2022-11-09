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
    public partial class WebForm3 : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["EShopConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Signupbtn_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(connString))
            {
                SqlCommand checkUser = new SqlCommand("Select UId from [User] where UserName= @UserName", connection);
                checkUser.Parameters.AddWithValue("@UserName", usernameinput.Value);
                connection.Open();
                var Result = checkUser.ExecuteScalar();

                if (Result != null)
                {
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Text = "This user is already taken! Choose another username";
                }
                else
                {
                    SqlCommand InsertUser = new SqlCommand("Insert into [User] values(@UserName, @Email, @password)", connection);

                    InsertUser.Parameters.AddWithValue("@UserName", HttpUtility.HtmlEncode(usernameinput.Value));
                    InsertUser.Parameters.AddWithValue("@Email", HttpUtility.HtmlEncode(emailinput.Value));
                    InsertUser.Parameters.AddWithValue("@password", HttpUtility.HtmlEncode(hashPassword(passinput.Value)));

                    int state = InsertUser.ExecuteNonQuery();
                    connection.Close();
                    if (state == 1)
                    {
                        Label1.ForeColor = System.Drawing.Color.Green;
                        Label1.Text = "Your account created successfully";
                    }
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