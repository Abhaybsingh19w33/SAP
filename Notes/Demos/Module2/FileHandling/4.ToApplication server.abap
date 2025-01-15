*&---------------------------------------------------------------------*
*& Report  ZGT_FILE5_TOAPPLICATION
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
======================================
Create a notepad with below data and save in on ur desktop.
Give the name of the notepad as Materials.txt

material1 	1	ROH	SHORTDESC	KM	01
material2	1	ROH	SHORTDESC	KM	01
material3	1	ROH	SHORTDESC	KM	01
material4	1	ROH	SHORTDESC	KM	01	
==================================================


REPORT ZGT_FILE5_TOAPPLICATION.

TYPES: BEGIN OF TY_MARA,
         MATNR TYPE MATNR, " Material Number
         MBRSH TYPE MBRSH, " Industry sector
         MTART TYPE MTART, " Material TYPE
         MAKTX TYPE MAKTX, " MATERIAL DESC
         MEINS TYPE MEINS, " Base Unit of Measure
         MATKL TYPE MATKL, " Material Group

       END OF TY_MARA.

DATA : IT_MARA TYPE  TABLE OF TY_MARA,
       WA_MARA TYPE TY_MARA,
       LV_FILE TYPE STRING.

PARAMETERS : P_FILE TYPE RLGRAP-FILENAME.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR P_FILE.

  CALL FUNCTION 'F4_FILENAME'
    EXPORTING
      PROGRAM_NAME  = SYST-CPROG
      DYNPRO_NUMBER = SYST-DYNNR
*     FIELD_NAME    = ' '
    IMPORTING
      FILE_NAME     = P_FILE.

START-OF-SELECTION.

  LV_FILE = P_FILE .

  "From Desktop to internal table in SAP
  CALL FUNCTION 'GUI_UPLOAD'
    EXPORTING
      FILENAME            = LV_FILE
      FILETYPE            = 'ASC'
      HAS_FIELD_SEPARATOR = 'X'
    TABLES
      DATA_TAB            = IT_MARA.

  IF SY-SUBRC <> 0.
* Implement suitable error handling here
  ENDIF.

"For creating a file in application server
  OPEN DATASET 'ZRTC_FILE1' FOR OUTPUT IN TEXT MODE ENCODING DEFAULT.

  "From internal table to file in application server.
  LOOP AT it_mara INTO wa_mara.

    TRANSFER wa_mara  TO 'ZRTC_FILE1'.
    CLEAR wa_mara.
  ENDLOOP.

  CLOSE DATASET 'ZRTC_FILE1'.

  IF sy-subrc = 0.
  WRITE : 'The file is uploaded to Application server.   Please check the file through AL11'.
* Implement suitable error handling here
ENDIF.