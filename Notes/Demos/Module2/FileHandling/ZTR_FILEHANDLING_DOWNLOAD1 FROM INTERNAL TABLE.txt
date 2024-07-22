REPORT ZTRCAP_FILEHANDLING_DOWN.
	
TYPES : BEGIN OF TY_SPFLI,  "User defined internal table type
       CARRID TYPE SPFLI-CARRID,
       CONNID TYPE SPFLI-CONNID,
       COUNTRYFR TYPE SPFLI-COUNTRYFR,
       CITYFROM TYPE SPFLI-CITYFROM,
      END OF TY_SPFLI.

DATA : IT_SPFLI TYPE TABLE OF TY_SPFLI .
DATA : WA_SPFLI TYPE TY_SPFLI.

SELECT CARRID CONNID COUNTRYFR CITYFROM FROM SPFLI
      INTO TABLE IT_SPFLI.

CALL FUNCTION 'GUI_DOWNLOAD'
  EXPORTING
*   BIN_FILESIZE                    =
    FILENAME                        = 'D:\Airline.TXT'
    FILETYPE                        = 'ASC'
*   APPEND                          = ' '
   WRITE_FIELD_SEPARATOR           = 'X'
  TABLES
    DATA_TAB                        = IT_SPFLI.

IF SY-SUBRC <> 0.
* Implement suitable error handling here
ENDIF.