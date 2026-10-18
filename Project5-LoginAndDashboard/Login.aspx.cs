using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace StudentRegistrationSystem
{
    public partial class Login : Page
    {
        string cs = ConfigurationManager
            .ConnectionStrings["StudentDBConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT COUNT(*) FROM Users " +
                               "WHERE Username=@User AND Password=<redacted>";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@User", txtUsername.Text.Trim());
                    cmd.Parameters.AddWithValue("@Pass", txtPassword.Text);

                    con.Open();
                    int count = (int)cmd.ExecuteScalar();

                    if (count == 1)
                    {
                        Session["AdminUser"] = txtUsername.Text.Trim();
                        Response.Redirect("Dashboard.aspx");
                    }
                    else
                    {
                        lblError.Text = "Invalid username or password.";
                    }
                }
            }
        }
    }
}
