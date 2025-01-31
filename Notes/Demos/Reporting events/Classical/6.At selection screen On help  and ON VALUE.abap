*&---------------------------------------------------------------------*
*& Report  ZRTC_CLASSICALEVENTS1
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT ZRTC_CLASSICALEVENTS2 NO STANDARD PAGE HEADING LINE-COUNT 10(2).
*
*DATA : IT_T001 TYPE TABLE OF T001.
*PARAMETERS : P_NAME TYPE  IBIPPARMS-PATH,
*             P_AGE  TYPE  CHAR2.
*
*AT SELECTION-SCREEN ON HELP-REQUEST FOR P_AGE. "(f1)
*  MESSAGE 'Enter your age' TYPE 'I'.
*
*
*AT SELECTION-SCREEN ON VALUE-REQUEST FOR P_NAME.
*
*
* CALL FUNCTION 'F4_FILENAME'
*    EXPORTING
*      PROGRAM_NAME  = SYST-CPROG
*      DYNPRO_NUMBER = SYST-DYNNR
*    IMPORTING
*      FILE_NAME     = P_NAME.

**  ====================
*  internal table made to populate the value of DEPTNO when pressing f4
TYPES: BEGIN OF TY_FINAL,
       CARRID TYPE S_CARRID,
      END OF TY_FINAL.

DATA: IT_CARRID TYPE  TABLE OF TY_FINAL.
PARAMETERS: P_CARRID TYPE S_CARRID.
DATA: IT_RETURN LIKE DDSHRETVAL OCCURS 0 WITH HEADER LINE.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR P_CARRID.

  SELECT  CARRID FROM SCARR
  INTO TABLE IT_CARRID.

  CALL FUNCTION 'F4IF_INT_TABLE_VALUE_REQUEST'
    EXPORTING
      RETFIELD   = 'CARRID'   "field of internal table
      VALUE_ORG  = 'S'        "To return structured value
    TABLES
      VALUE_TAB  = IT_CARRID  "internal table
      RETURN_TAB = IT_RETURN.

  P_CARRID         = IT_RETURN-FIELDVAL. " for displaying selected value in the screen