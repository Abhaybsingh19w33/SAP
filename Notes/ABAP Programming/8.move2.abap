*&---------------------------------------------------------------------*
*& Report  ZYNY_TEST2
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT ZYNY_TEST2.
*Subscript starts from 0
data : num1 value 7,
       num2 value 8,
       fname(6) type c value 'ABCDEF',
       mname(5) type c value 'GHIJK',
       lname(10) type c value 'LMNOPQRSTUVWXYZ'.

write:/ 'Num1 is:', num1.
write:/ 'Num2 is:', num2.

move num1 to fname.
Move mname(3)  to lname. "Implies starting from 0th position to 3    "will be copied to lname
write:/ 'lname is:', lname.

Move mname+2  to lname. "leave the first 2 and copy all to lname

write:/ 'lname is:', lname.

Move mname+1(2) to lname.   " leave the first one and copy next 2 to  lname
write:/ 'lname is:', lname.