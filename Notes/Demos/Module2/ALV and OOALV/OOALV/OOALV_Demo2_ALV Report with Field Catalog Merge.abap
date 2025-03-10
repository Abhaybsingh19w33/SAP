REPORT  Z.
DATA : IT_SPFLI TYPE TABLE OF SPFLI. "DECLARE INTERNAL TABLE FOR SPFLI
DATA:
R_CONTAINER TYPE REF TO CL_GUI_CUSTOM_CONTAINER,
R_GRID TYPE REF TO CL_GUI_ALV_GRID,
    IT_FCAT TYPE LVC_T_FCAT.
SELECT * FROM SPFLI INTO TABLE IT_SPFLI.
CALL SCREEN 100.

*&---------------------------------------------------------------------
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------
*text
*----------------------------------------------------------------------
MODULE STATUS_0100 OUTPUT.
*SET PF-STATUS 'SCREEN1'.
*SET TITLEBAR 'TITLE1'.
ENDMODULE. " STATUS_0100 OUTPUT

*&---------------------------------------------------------------------
*& Module USER_COMMAND_0100 INPUT
*&---------------------------------------------------------------------
*text
*----------------------------------------------------------------------
MODULE USER_COMMAND_0100 INPUT.
CASE SY-UCOMM.
WHEN 'BACK'.
LEAVE TO SCREEN 0.
ENDCASE.
ENDMODULE.

*&---------------------------------------------------------------------
*& Module LIST OUTPUT
*&---------------------------------------------------------------------
*text
*----------------------------------------------------------------------
MODULE LIST OUTPUT.
CREATE OBJECT R_CONTAINER
EXPORTING
CONTAINER_NAME = 'CONTAINER'.

CREATE OBJECT R_GRID
EXPORTING
I_PARENT = R_CONTAINER.

CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
EXPORTING
   I_STRUCTURE_NAME = 'SPFLI'
CHANGING
   CT_FIELDCAT   = IT_FCAT.


CALL METHOD R_GRID->SET_TABLE_FOR_FIRST_DISPLAY
CHANGING
 IT_FIELDCATALOG = IT_FCAT
IT_OUTTAB = IT_SPFLI. "PASS INTERNAL TABLE TO DISPLAY ALV FORMAT
ENDMODULE.