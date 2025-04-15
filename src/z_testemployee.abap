REPORT z_testemployee.

* Data declaration
" Work area for single employee record
DATA: wa_employee TYPE zemployees.

" Internal table to store multiple employee records (for future use)
DATA: it_employee TYPE STANDARD TABLE OF zemployees.

" insert initial data using internal table and work area.
CLEAR it_employee.

wa_employee-employee = '10000001'.
wa_employee-surname = 'ADAM'.
wa_employee-firstname = 'JOHN'.
wa_employee-title = 'MR'.
wa_employee-dob = '19880101'.
APPEND wa_employee TO it_employee.

wa_employee-employee = '10000002'.
wa_employee-surname = 'NG'.
wa_employee-firstname = 'AI LING'.
wa_employee-title = 'MS'.
wa_employee-dob = '19900115'.
APPEND wa_employee TO it_employee.

wa_employee-employee = '10000003'.
wa_employee-surname = 'RAJ'.
wa_employee-firstname = 'KUMAR'.
wa_employee-title = 'MR'.
wa_employee-dob = '19920320'.
APPEND wa_employee TO it_employee.

wa_employee-employee = '10000004'.
wa_employee-surname = 'LEE'.
wa_employee-firstname = 'AMY'.
wa_employee-title = 'MS'.
wa_employee-dob = '19950101'.
APPEND wa_employee TO it_employee.

wa_employee-employee = '10000005'.
wa_employee-surname = 'TAN'.
wa_employee-firstname = 'AH HOCK'.
wa_employee-title = 'MR'.
wa_employee-dob = '19851212'.
APPEND wa_employee TO it_employee.

LOOP AT it_employee INTO wa_employee.
  INSERT zemployees FROM wa_employee.
  IF sy-subrc = 0.
    WRITE: / 'Inserted:', wa_employee-employee, wa_employee-firstname.
  ELSE.
    WRITE: / 'Insert failed:', wa_employee-employee, 'Error:', sy-subrc.
  ENDIF.
ENDLOOP.


" INSERT example. 
CLEAR wa_employee. " Always clear work area before use

wa_employee-employee = '10000008'.
wa_employee-surname = 'LEE'.
wa_employee-firstname = 'AMY'.
wa_employee-title = 'MS'.
wa_employee-dob = '19950101'.

INSERT zemployees FROM wa_employee. 

IF sy-subrc = 0.
WRITE: "Data added successfully".
ELSE. 
WRITE: "ERROR", sy-subrc.
ENDIF. /* expected output will be Data added succcessfully

SKIP.

" DELETE Example
DELETE FROM zemployees WHERE employee = '10000004'. " direct deletion using a WHERE clause
 if sy-subrc = 0.
   WRITE: 'Data deleted successfully'.
   ELSE.
     WRITE: 'error', sy-subrc.
     ENDIF. /* expected output will be Data deleted succcessfully


SKIP.

CLEAR wa_employee.

wa_employee-employee = '10000008'. 
DELETE zemployees FROM wa_employee. " deletes a record that matches all the key fields in the work area

 if sy-subrc = 0.
   WRITE: 'Data deleted successfully'.
   ELSE.
     WRITE: 'error', sy-subrc.
     ENDIF. /* expected output will be Data deleted succcessfully

SKIP.

" MODIFY example. (update an existing record OR insert a new one)
CLEAR wa_employee.

wa_employee-employee = '10000005'.
wa_employee-surname = 'LEE'.
wa_employee-firstname = 'AMY'.
wa_employee-title = 'MS'.
wa_employee-dob = '19950101'.

SELECT SINGLE * FROM zemployees 
  INTO @wa_employee "Declare its ABAP variable (host)
  WHERE employee = @wa_employee-employee.

IF sy-subrc = 0.  "check if the data from work area already exists in the table or not
  " if the data is present. the data will be updated.
    MODIFY zemployees FROM wa_employee.
    IF sy-subrc = 0.
      WRITE: 'Data updated successfully'.
    ELSE.
      WRITE: 'Error', sy-subrc.
    ENDIF.
ELSE.
  " if the data is not present. the data will be added
      MODIFY zemployees FROM wa_employee.
    IF sy-subrc = 0.
      WRITE: 'Data added successfully'.
    ELSE.
      WRITE: 'Error', sy-subrc.
    ENDIF.
ENDIF.

SKIP.

" data display
SELECT * FROM zemployees INTO TABLE it_employee.

  LOOP AT it_employee INTO wa_employee.
    WRITE: / wa_employee-employee,
             wa_employee-surname,
             wa_employee-firstname,
             wa_employee-title,
             wa_employee-dob.
  ENDLOOP.




