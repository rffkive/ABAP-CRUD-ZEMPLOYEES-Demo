REPORT z_testemployee.

/* Data declaration
DATA: wa_employee TYPE zemployees.
it_employee TYPE STANDARD TABLE OF zemployees.

/* INSERT DATA INTO THE TABLE OF ZEMPLOYEES using Internal table.
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


/* INSERT example. 
CLEAR wa_employee. /* always clear work area first before start include entry in it

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

/* DELETE Example
DELETE FROM zemployees WHERE employee = '10000004'.
 if sy-subrc = 0.
   WRITE: 'Data deleted successfully'.
   ELSE.
     WRITE: 'error', sy-subrc.
     ENDIF. /* expected output will be Data deleted succcessfully


SKIP.

CLEAR wa_employee.

wa_employee-employee = '10000008'. /
DELETE zemployees FROM wa_employee.

 if sy-subrc = 0.
   WRITE: 'Data deleted successfully'.
   ELSE.
     WRITE: 'error', sy-subrc.
     ENDIF. /* expected output will be Data deleted succcessfully

SKIP.


