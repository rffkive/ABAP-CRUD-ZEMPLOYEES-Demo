# ABAP CRUD: ZEMPLOYEES Demo

This project demonstrates basic ABAP CRUD operations using a custom table `ZEMPLOYEES`.

## Features

- Insert and update employee records using `MODIFY`
- Delete records with `DELETE` (both key-based and from work area)
- Display table data using `SELECT INTO TABLE` and `LOOP`
- Use of `CLEAR`, `SY-SUBRC`, `SKIP`, and `@DATA`

## ABAP Program Included

**Z_TESTEMPLOYEE**  
Main report for performing the following:
- INSERT from `wa_employee`
- DELETE using key and `FROM work area`
- UPDATE using `MODIFY` with `SELECT SINGLE` check
- READ table using `SELECT * INTO TABLE it_employee`

## Sample Table Structure (ZEMPLOYEES)

| Field       | Type     | Description        |
|-------------|----------|--------------------|
| EMPLOYEE    | CHAR(8)  | Employee ID        |
| SURNAME     | CHAR(40) | Last Name          |
| FIRSTNAME   | CHAR(40) | First Name         |
| TITLE       | CHAR(10) | Title (Mr/Ms/etc.) |
| DOB         | DATS     | Date of Birth      |

---
