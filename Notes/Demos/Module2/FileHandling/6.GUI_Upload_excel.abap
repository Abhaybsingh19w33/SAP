*&---------------------------------------------------------------------*
Create a excel  with below data and save in on ur desktop.
Give the name of the excel as Materials.xls
Close the EXCEl file. 

material1 	1	ROH	SHORTDESC	KM	01
material2	1	ROH	SHORTDESC	KM	01
material3	1	ROH	SHORTDESC	KM	01
material4	1	ROH	SHORTDESC	KM	01

REPORT ZGT_FILE4_UPLOADEXCEL.


TYPES: BEGIN OF TY_TAB,  " LOCAL STRS
         MATNR TYPE MATNR, " Material Number
         MBRSH TYPE MBRSH, " Industry sector
         MTART TYPE MTART, " Material TYPE
         MAKTX TYPE MAKTX, " MATERIAL DESC
         MEINS TYPE MEINS, " Base Unit of Measure
         MATKL TYPE MATKL, " Material Group

       END OF TY_TAB.

DATA: IT_mara TYPE STANDARD TABLE OF TY_TAB,
      WA_mara TYPE TY_TAB.



DATA LV_DATE TYPE SY-DATUM.

DATA IT_RAW TYPE TRUXS_T_TEXT_DATA.





PARAMETERS P_FILE TYPE RLGRAP-FILENAME.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR P_FILE.
*
  CALL FUNCTION 'F4_FILENAME'
    EXPORTING
      PROGRAM_NAME  = SYST-CPROG
      DYNPRO_NUMBER = SYST-DYNNR
*     FIELD_NAME    = ' '
    IMPORTING
      FILE_NAME     = P_FILE.

START-OF-SELECTION.

  CALL FUNCTION 'TEXT_CONVERT_XLS_TO_SAP'
    EXPORTING
      I_FIELD_SEPERATOR    = 'X'
      I_LINE_HEADER        = 'X'
      I_TAB_RAW_DATA       = IT_RAW
      I_FILENAME           = P_FILE
    TABLES
      I_TAB_CONVERTED_DATA = IT_MARA
* EXCEPTIONS
*     CONVERSION_FAILED    = 1
*     OTHERS               = 2
    .
  IF SY-SUBRC <> 0.
* Implement suitable error handling here
  ENDIF.

START-OF-SELECTION.

.
  LOOP AT IT_MARA INTO WA_MARA.

    WRITE :/ WA_MARA-MATNR,
    WA_MARA-MBRSH,
    WA_MARA-MTART,
    WA_MARA-MAKTX ,

    WA_MARA-MEINS,
    WA_MARA-MATKL .
    CLEAR WA_MARA.

  ENDLOOP.