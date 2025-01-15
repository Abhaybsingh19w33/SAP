REPORT ZAT_FILE1.
" Program to upload data from Notepad(materials.txt) to SAP Server

======================================
Create a notepad with below data and save in on ur desktop.
Give the name of the notepad as Materials.txt

material1 	1	ROH	SHORTDESC	KM	01
material2	1	ROH	SHORTDESC	KM	01
material3	1	ROH	SHORTDESC	KM	01
material4	1	ROH	SHORTDESC	KM	01	
==================================================
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
WRITE SYST-CPROG.
WRITE SYST-DYNNR."Number of the current dynpro. The selection screen currently being processed. In list processing, the number of the subscreen dynpro.
  LV_FILE = P_FILE.

  "From Desktop to internal table in SAP
  CALL FUNCTION 'GUI_UPLOAD'
    EXPORTING
      FILENAME            = LV_FILE
      FILETYPE            = 'ASC'  "Ascii conversion supported flat files like notepad
      HAS_FIELD_SEPARATOR = 'x'
    TABLES
      DATA_TAB            = IT_MARA.
*
  IF SY-SUBRC <> 0.
* Implement suitable error handling here
  ENDIF.
  LOOP AT IT_MARA INTO WA_MARA.

    WRITE :/ WA_MARA-MATNR,
    WA_MARA-MBRSH,
    WA_MARA-MTART,
    WA_MARA-MAKTX ,

    WA_MARA-MEINS,
    WA_MARA-MATKL .
    CLEAR WA_MARA.

  ENDLOOP.