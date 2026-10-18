# Project 4 — Full CRUD: Edit and Delete

The Students GridView gains Edit and Delete on every row. Edit makes the row editable with Update and Cancel; Delete removes the record. Together with Projects 2 and 3 this completes Create, Read, Update and Delete.

## Features

- Everything in Project 3
- Edit / Update / Cancel inside the GridView
- Delete with the record Id taken from DataKeyNames
- Parameterized UPDATE and DELETE queries

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
2. Right-click **Students.aspx (manage page) and StudentRegistration.aspx (entry page)** and choose **Set as Start Page**.
3. Press **Ctrl + F5**.

**Database:** Run database.sql in SSMS first.

Back to the [main README](../README.md).
