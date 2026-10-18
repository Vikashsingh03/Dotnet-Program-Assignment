using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace StudentRegistrationSystem
{
    public partial class Dashboard : Page
    {
        string cs = ConfigurationManager
            .ConnectionStrings["StudentDBConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminUser"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                lblWelcome.Text = "Welcome, " + Session["AdminUser"] + "!";
                lblTotal.Text = CountStudents("");
                lblBTech.Text = CountStudents("WHERE Course='B.Tech'");
                lblMCA.Text = CountStudents("WHERE Course='MCA'");
                LoadRecent();
            }
        }

        string CountStudents(string where)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand(
                    "SELECT COUNT(*) FROM Students " + where, con))
                {
                    con.Open();
                    return cmd.ExecuteScalar().ToString();
                }
            }
        }

        void LoadRecent()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT TOP 5 Id, Name, Course, CreatedAt " +
                               "FROM Students ORDER BY Id DESC";

                using (SqlDataAdapter da = new SqlDataAdapter(query, con))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvRecent.DataSource = dt;
                    gvRecent.DataBind();
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}
