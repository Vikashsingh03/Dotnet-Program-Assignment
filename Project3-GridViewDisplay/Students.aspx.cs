using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentRegistrationSystem
{
    public partial class Students : Page
    {
        string cs = ConfigurationManager
            .ConnectionStrings["StudentDBConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStudents();
            }
        }

        void LoadStudents()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT Id, Name, Email, Course, CreatedAt " +
                               "FROM Students ORDER BY Id DESC";

                using (SqlDataAdapter da = new SqlDataAdapter(query, con))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvStudents.DataSource = dt;
                    gvStudents.DataBind();

                    lblCount.Text = "Total students: " + dt.Rows.Count;
                }
            }
        }

        protected void gvStudents_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvStudents.PageIndex = e.NewPageIndex;
            LoadStudents();
        }
    }
}
