<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Dashboard.aspx.cs"
    Inherits="StudentRegistrationSystem.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
    <style>
        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background: linear-gradient(135deg, #dbeafe, #eef2f7);
            margin: 0;
            padding: 40px 15px;
        }

        .container {
            background: #ffffff;
            max-width: 860px;
            margin: auto;
            padding: 32px;
            border-radius: 14px;
            box-shadow: 0 12px 32px rgba(23, 105, 170, 0.18);
        }

        h2 {
            color: #1769aa;
            margin-top: 0;
        }

        .grid {
            width: 100%;
            border-collapse: collapse;
            font-size: 15px;
        }

        .grid th {
            background: #1769aa;
            color: #ffffff;
            padding: 11px;
            text-align: left;
        }

        .grid td {
            padding: 10px 11px;
            border-bottom: 1px solid #e3e9f0;
        }

        .grid tr:hover td {
            background: #f4f8fc;
        }

        .grid input[type="text"] {
            width: 94%;
            padding: 6px;
            font-size: 14px;
            border: 1px solid #c9d4e0;
            border-radius: 6px;
            box-sizing: border-box;
        }

        .count {
            font-weight: bold;
            color: #1769aa;
        }

        .cards {
            display: flex;
            gap: 14px;
            margin: 18px 0;
        }

        .card {
            flex: 1;
            background: #eef4fb;
            border: 1px solid #cfdce8;
            border-radius: 12px;
            padding: 16px;
            text-align: center;
        }

        .card h3 {
            margin: 0;
            font-size: 28px;
            color: #1769aa;
        }

        .card p {
            margin: 4px 0 0;
            color: #555555;
            font-size: 13px;
        }

        .btn {
            display: inline-block;
            padding: 10px 18px;
            margin-right: 8px;
            font-size: 14px;
            font-weight: bold;
            color: #ffffff;
            background: #1769aa;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            text-decoration: none;
        }

        .btn:hover {
            background: #0f4c7c;
        }

        .red {
            background: #c0392b;
        }

        .red:hover {
            background: #96281b;
        }

        .welcome {
            color: #1e7d32;
            font-weight: bold;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Admin Dashboard</h2>
            <asp:Label ID="lblWelcome" runat="server" CssClass="welcome" />

            <div class="cards">
                <div class="card">
                    <h3><asp:Label ID="lblTotal" runat="server" /></h3>
                    <p>Total Students</p>
                </div>
                <div class="card">
                    <h3><asp:Label ID="lblBTech" runat="server" /></h3>
                    <p>B.Tech</p>
                </div>
                <div class="card">
                    <h3><asp:Label ID="lblMCA" runat="server" /></h3>
                    <p>MCA</p>
                </div>
            </div>

            <h3>Recent Registrations</h3>
            <asp:GridView ID="gvRecent" runat="server"
                AutoGenerateColumns="false" CssClass="grid">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Course" HeaderText="Course" />
                    <asp:BoundField DataField="CreatedAt" HeaderText="Registered On"
                        DataFormatString="{0:dd-MMM-yyyy}" />
                </Columns>
            </asp:GridView>
            <br />

            <asp:HyperLink ID="lnkRegister" runat="server" CssClass="btn"
                NavigateUrl="StudentRegistration.aspx">Register New Student</asp:HyperLink>
            <asp:HyperLink ID="lnkStudents" runat="server" CssClass="btn"
                NavigateUrl="Students.aspx">View All Students</asp:HyperLink>
            <asp:Button ID="btnLogout" runat="server" Text="Logout"
                CssClass="btn red" OnClick="btnLogout_Click" />
        </div>
    </form>
</body>
</html>
