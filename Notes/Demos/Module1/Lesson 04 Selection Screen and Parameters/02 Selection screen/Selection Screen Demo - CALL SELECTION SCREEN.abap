REPORT  Z.
SELECTION-SCREEN BEGIN OF SCREEN 500.
  PARAMETERS NAME TYPE SY-UNAME.
  PARAMETERS AGE TYPE I.
SELECTION-SCREEN END OF SCREEN 500.

CALL SELECTION-SCREEN 500 STARTING AT 2 10.

WRITE : / 'The name is ', NAME.
WRITE : / 'The Age  is ', AGE.

*In the above case if the statement
*CALL SELECTION-SCREEN is not coded nothing happens
*The selection screen is not displayed
" ____________________________________________________

REPORT Z.
SELECTION-SCREEN BEGIN OF SCREEN 500 TITLE SCREENT.
  PARAMETERS NAME TYPE SY-UNAME.
  PARAMETERS AGE TYPE I.
SELECTION-SCREEN END OF SCREEN 500.

SCREENT = 'Emp Details'.
CALL SELECTION-SCREEN 500 STARTING AT 2 5 .

WRITE : / 'The name is ', NAME.
WRITE : / 'The Age  is ', AGE.

*In the above case if the statement
*CALL SELECTION-SCREEN is not coded nothing happens
*The selection screen is not displayed

" ____________________________________________________________________

REPORT Z.
SELECTION-SCREEN BEGIN OF SCREEN 500 TITLE SCREENT AS WINDOW.
  PARAMETERS NAME TYPE SY-UNAME.
  PARAMETERS AGE TYPE I.
SELECTION-SCREEN END OF SCREEN 500.

SCREENT = 'Emp Details'.
CALL SELECTION-SCREEN 500 STARTING AT 2 5 .

WRITE : / 'The name is ', NAME.
WRITE : / 'The Age  is ', AGE.

*In the above case if the statement
*CALL SELECTION-SCREEN is not coded nothing happens
*The selection screen is not displayed