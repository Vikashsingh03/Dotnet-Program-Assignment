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

        protected void gvStudents_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvStudents.EditIndex = e.NewEditIndex;
            LoadStudents();
        }

        protected void gvStudents_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvStudents.EditIndex = -1;
            LoadStudents();
        }

        protected void gvStudents_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gvStudents.DataKeys[e.RowIndex].Value);
            GridViewRow row = gvStudents.Rows[e.RowIndex];

            string name = ((TextBox)row.Cells[2].Controls[0]).Text.Trim();
            string email = ((TextBox)row.Cells[3].Controls[0]).Text.Trim();
            string course = ((TextBox)row.Cells[4].Controls[0]).Text.Trim();

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "UPDATE Students SET Name=@Name, Email=@Email, " +
                               "Course=@Course WHERE Id=@Id";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Course", course);
                    cmd.Parameters.AddWithValue("@Id", id);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            gvStudents.EditIndex = -1;
            LoadStudents();
        }

        protected void gvStudents_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvStudents.DataKeys[e.RowIndex].Value);

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "DELETE FROM Students WHERE Id=@Id";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Id", id);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            LoadStudents();
        }
    }
}
