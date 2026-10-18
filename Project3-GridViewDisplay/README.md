# Project 3 — Display All Students in a GridView

Adds a Students page that loads all registrations from the database into a DataTable with SqlDataAdapter and displays them in a GridView with paging and a total count.

## Features

- Everything in Project 2
- Students page with a styled GridView
- Paging — 5 records per page
- Total students count below the grid

## Files

| File | Purpose |
| --- | --- |
| `StudentRegistrationSystem.sln` | Visual Studio solution — double-click to open |
| `StudentRegistration.aspx` + code-behind | Registration form with database save |
| `Students.aspx` + code-behind | GridView page |
| `database.sql` | Creates the database and tables |
| `Web.config` | Application configuration |

## How to Run

1. Open `StudentRegistrationSystem.sln` in Visual Studio 2022.
2. Right-click **Students.aspx (display page) and StudentRegistration.aspx (entry page)** and choose **Set as Start Page**.
3. Press **Ctrl + F5**.

**Database:** Run database.sql in SSMS first.

Back to the [main README](../README.md).
