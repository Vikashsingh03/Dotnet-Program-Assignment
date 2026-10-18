using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;

namespace StudentRegistrationSystem
{
    public partial class StudentRegistration : System.Web.UI.Page
    {
        string cs = ConfigurationManager
            .ConnectionStrings["StudentDBConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "INSERT INTO Students (Name, Email, Course) " +
                               "VALUES (@Name, @Email, @Course)";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@Course", ddlCourse.SelectedValue);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            lblName.Text = Server.HtmlEncode(txtName.Text.Trim());
            lblEmail.Text = Server.HtmlEncode(txtEmail.Text.Trim());
            lblCourse.Text = Server.HtmlEncode(ddlCourse.SelectedValue);

            lblMessage.Text = "Registration successful! Details saved in database.";
            lblMessage.ForeColor = Color.Green;
            lblMessage.Font.Bold = true;

            pnlResult.Visible = true;
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtName.Text = "";
            txtEmail.Text = "";
            ddlCourse.SelectedIndex = 0;

            lblMessage.Text = "";
            lblName.Text = "";
            lblEmail.Text = "";
            lblCourse.Text = "";

            pnlResult.Visible = false;
        }
    }
}
