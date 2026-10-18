<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Students.aspx.cs"
    Inherits="StudentRegistrationSystem.Students" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Students</title>
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
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Registered Students</h2>

            <asp:GridView ID="gvStudents" runat="server"
                AutoGenerateColumns="false" CssClass="grid"
                AllowPaging="true" PageSize="5"
                OnPageIndexChanging="gvStudents_PageIndexChanging">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Course" HeaderText="Course" />
                    <asp:BoundField DataField="CreatedAt" HeaderText="Registered On"
                        DataFormatString="{0:dd-MMM-yyyy}" />
                </Columns>
            </asp:GridView>

            <br />
            <asp:Label ID="lblCount" runat="server" CssClass="count" />
        </div>
    </form>
</body>
</html>
