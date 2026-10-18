# Project 5 — Login, Authentication and Admin Dashboard

Adds an admin login checked against a Users table in the database. After login, the user is stored in Session; the Students and Dashboard pages refuse to open without it. The dashboard shows student count cards, the 5 latest registrations, quick links and a Logout button.

## Features

- Admin login — admin / admin123 (created by database.sql)
- Session-based authentication with a guard on protected pages
- Dashboard with Total / B.Tech / MCA count cards
- Recent registrations list and Logout

## Files

| File | Purpose |
| --- | --- |
| `StudentRegistrationSystem.sln` | Visual Studio solution — double-click to open |
| `Login.aspx` + code-behind | Admin login page |
| `Dashboard.aspx` + code-behind | Count cards, recent registrations, logout |
| `Students.aspx` + code-behind | Protected CRUD page (Project 4) |
| `StudentRegistration.aspx` + code-behind | Registration form with database save |
| `database.sql` | Creates the database and tables |
| `Web.config` | Application configuration |

## How to Run

1. Open `StudentRegistrationSystem.sln` in Visual Studio 2022.
2. Right-click **Login.aspx (start page)** and choose **Set as Start Page**.
3. Press **Ctrl + F5**.

**Database:** Run database.sql in SSMS first — it creates both the Students and Users tables and the admin account.

Back to the [main README](../README.md).
