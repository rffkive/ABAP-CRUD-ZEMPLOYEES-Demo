REPORT z_testemployee.

/* Data declaration
DATA: wa_employee TYPE zemployees.
it_employee TYPE STANDARD TABLE OF zemployees.

/* Insert example. 
CLEAR wa_employee. /* always clear work area first before start include entry in it
wa_employee-employee = '10000008'.
wa_employee-surname = 'LEE'.
wa_employee-firstname = 'AMY'.
wa_employee-title = 'MS'.
wa_employee-dob = '19950101'.
INSERT zemployees FROM wa_employee.
