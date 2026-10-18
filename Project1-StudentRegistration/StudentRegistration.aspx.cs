using System;
using System.Drawing;

namespace StudentRegistrationSystem
{
    public partial class StudentRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            lblName.Text = Server.HtmlEncode(txtName.Text.Trim());
            lblEmail.Text = Server.HtmlEncode(txtEmail.Text.Trim());
            lblCourse.Text = Server.HtmlEncode(ddlCourse.SelectedValue);

            lblMessage.Text = "Registration successful!";
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
