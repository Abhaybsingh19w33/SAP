REPORT  Z.

*If a program has a selection screen
*and you issue a write statement
*in an event triggere before start-of-selection
*(Initialization or at selection screen or....),
* you will not see the output from it.
*For example, if you have a parameters statement
*in your program,
*a selection screen is created for your program
*to allow the user to enter the parameter value.
*If in this program you issue a
*write in initialization,
*you will not see the output from the write statement.

INITIALIZATION.
  WRITE / '1'.

START-OF-SELECTION.
  PARAMETERS: A TYPE I.
  WRITE / '2'.

END-OF-SELECTION.
  WRITE / '3'.

*In the above case if there is no parameters statement, u see the op as
*1.
*2.
*3.
*
*If there is a parameters statement as in the above case the op
*is
*2.
*3.