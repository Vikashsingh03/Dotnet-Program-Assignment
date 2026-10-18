<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="StudentRegistration.aspx.cs"
    Inherits="StudentRegistrationSystem.StudentRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>StudentRegistration</title>
    <style>
        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background: linear-gradient(135deg, #dbeafe, #eef2f7);
            margin: 0;
            padding: 40px 15px;
        }

        .container {
            background: #ffffff;
            max-width: 460px;
            margin: auto;
            padding: 32px;
            border-radius: 14px;
            box-shadow: 0 12px 32px rgba(23, 105, 170, 0.18);
        }

        h2 {
            text-align: center;
            color: #1769aa;
            margin-top: 0;
        }

        .label {
            display: block;
            font-weight: bold;
            color: #333333;
            margin-top: 6px;
        }

        .field {
            width: 100%;
            padding: 11px;
            margin: 8px 0 4px;
            font-size: 15px;
            border: 1px solid #c9d4e0;
            border-radius: 8px;
            box-sizing: border-box;
        }

        .field:focus {
            outline: none;
            border-color: #1769aa;
            box-shadow: 0 0 0 3px rgba(23, 105, 170, 0.15);
        }

        .btn {
            padding: 11px 24px;
            margin-top: 16px;
            font-size: 15px;
            font-weight: bold;
            color: #ffffff;
            background: #1769aa;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }

        .btn:hover {
            background: #0f4c7c;
        }

        .btn-clear {
            color: #333333;
            background: #e8edf3;
            margin-left: 8px;
        }

        .btn-clear:hover {
            background: #d5dde6;
        }

        .btn-full {
            width: 100%;
        }

        .error {
            color: #d93025;
            font-size: 13px;
        }

        .result {
            margin-top: 22px;
            padding: 16px 20px;
            background: #eef7ee;
            border: 1px solid #bfe3bf;
            border-radius: 10px;
        }

        .result h3 {
            margin-top: 0;
            color: #1e7d32;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Student Registration</h2>

            <asp:Label runat="server" CssClass="label" Text="Student Name:" />
            <asp:TextBox ID="txtName" runat="server" CssClass="field" />
            <asp:RequiredFieldValidator runat="server"
                ControlToValidate="txtName"
                ErrorMessage="Enter student name"
                CssClass="error" Display="Dynamic" />
            <br />

            <asp:Label runat="server" CssClass="label" Text="Email:" />
            <asp:TextBox ID="txtEmail" runat="server" CssClass="field" />
            <asp:RequiredFieldValidator runat="server"
                ControlToValidate="txtEmail"
                ErrorMessage="Enter email"
                CssClass="error" Display="Dynamic" />
            <asp:RegularExpressionValidator runat="server"
                ControlToValidate="txtEmail"
                ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                ErrorMessage="Enter a valid email"
                CssClass="error" Display="Dynamic" />
            <br />

            <asp:Label runat="server" CssClass="label" Text="Select Course:" />
            <asp:DropDownList ID="ddlCourse" runat="server" CssClass="field">
                <asp:ListItem Text="-- Select Course --" Value="" />
                <asp:ListItem Text="BCA" Value="BCA" />
                <asp:ListItem Text="B.Tech" Value="B.Tech" />
                <asp:ListItem Text="MCA" Value="MCA" />
                <asp:ListItem Text="M.Tech" Value="M.Tech" />
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server"
                ControlToValidate="ddlCourse"
                InitialValue=""
                ErrorMessage="Select a course"
                CssClass="error" Display="Dynamic" />
            <br />

            <asp:Button ID="btnSubmit" runat="server"
                Text="Register"
                CssClass="btn"
                OnClick="btnSubmit_Click" />
            <asp:Button ID="btnClear" runat="server"
                Text="Clear"
                CssClass="btn btn-clear"
                CausesValidation="false"
                OnClick="btnClear_Click" />

            <br />
            <asp:Label ID="lblMessage" runat="server" />

            <asp:Panel ID="pnlResult" runat="server" CssClass="result" Visible="false">
                <h3>Registration Details</h3>
                <p>Name: <asp:Label ID="lblName" runat="server" /></p>
                <p>Email: <asp:Label ID="lblEmail" runat="server" /></p>
                <p>Course: <asp:Label ID="lblCourse" runat="server" /></p>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
