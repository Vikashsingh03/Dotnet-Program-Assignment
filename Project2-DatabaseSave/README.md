# Project 2 — Save Registrations in SQL Server (ADO.NET)

The registration form of Project 1, extended with ADO.NET: every registration is saved into the Students table of the StudentDB database using a parameterized INSERT query, which also prevents SQL injection.

## Features

- Everything in Project 1
- Registration data saved permanently in SQL Server
- Connection string stored in Web.config
- Parameterized INSERT query (SQL-injection safe)

## Files

| File | Purpose |
| --- | --- |
| `StudentRegistrationSystem.sln` | Visual Studio solution — double-click to open |
| `StudentRegistration.aspx` + code-behind | Registration form and its C# logic |
| `database.sql` | Creates the database and tables |
| `Web.config` | Application configuration |

## How to Run

1. Open `StudentRegistrationSystem.sln` in Visual Studio 2022.
2. Right-click **StudentRegistration.aspx** and choose **Set as Start Page**.
3. Press **Ctrl + F5**.

**Database:** Run database.sql in SSMS first to create the StudentDB database and Students table.

Back to the [main README](../README.md).
