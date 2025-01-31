*&---------------------------------------------------------------------*
*& Report ZTR_CGKP_ADOBE2_PROG
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZTR_CGKP_ADOBE2_PROG.

DATA : LV_KUNNR TYPE KUNNR,
       LV_NAME1 TYPE NAME1,
       LV_ORT01 TYPE ORT01,
       LV_LAND1 TYPE LAND1.

TYPES: TY_OUTPUTPARAMS TYPE SFPOUTPUTPARAMS,
       TY_DOCPARAMS TYPE SFPDOCPARAMS.

DATA: WA_OUTPUTPARAMS TYPE SFPOUTPUTPARAMS,
      WA_DOCPARAMS TYPE SFPDOCPARAMS.

DATA LV_KUNNR2 TYPE KUNNR.

DATA FM TYPE RS38L_FNAM.

START-OF-SELECTION.

PARAMETERS P_KUNNR TYPE KUNNR.

WA_OUTPUTPARAMS-DEVICE = 'PRINTER'.
WA_OUTPUTPARAMS-NODIALOG = 'X'.
WA_OUTPUTPARAMS-PREVIEW = 'X'.
WA_OUTPUTPARAMS-DEST = 'LP01'.

CALL FUNCTION 'FP_JOB_OPEN'
  CHANGING
    IE_OUTPUTPARAMS       = WA_OUTPUTPARAMS
* EXCEPTIONS
*   CANCEL                = 1
*   USAGE_ERROR           = 2
*   SYSTEM_ERROR          = 3
*   INTERNAL_ERROR        = 4
*   OTHERS                = 5
          .
IF SY-SUBRC <> 0.
* Implement suitable error handling here
ENDIF.

 CALL FUNCTION 'FP_FUNCTION_MODULE_NAME'
   EXPORTING
     I_NAME                     = 'ZTR_CGKP_ADOBE2'
  IMPORTING
    E_FUNCNAME                 =  FM
*    E_INTERFACE_TYPE           =
*    EV_FUNCNAME_INBOUND        =
           .
 SELECT KUNNR
       NAME1
       ORT01
       LAND1
  INTO (LV_KUNNR, LV_NAME1, LV_ORT01, LV_LAND1)
  FROM KNA1
  WHERE KUNNR eq P_KUNNR.
ENDSELECT.

WA_DOCPARAMS-LANGU = 'EN'.
WA_DOCPARAMS-COUNTRY = 'IN'.

 CALL FUNCTION FM
   EXPORTING
    /1BCDWB/DOCPARAMS        = WA_DOCPARAMS
     LV_KUNNR                 = LV_KUNNR
     LV_NAME1                 = LV_NAME1
     LV_ORT01                 = LV_ORT01
     LV_LAND1                 = LV_LAND1
*  IMPORTING
*    /1BCDWB/FORMOUTPUT       =
*  EXCEPTIONS
*    USAGE_ERROR              = 1
*    SYSTEM_ERROR             = 2
*    INTERNAL_ERROR           = 3
*    OTHERS                   = 4
           .
 IF SY-SUBRC <> 0.
* Implement suitable error handling here
 ENDIF.

 CALL FUNCTION 'FP_JOB_CLOSE'
*  IMPORTING
*    E_RESULT             =
*  EXCEPTIONS
*    USAGE_ERROR          = 1
*    SYSTEM_ERROR         = 2
*    INTERNAL_ERROR       = 3
*    OTHERS               = 4
           .
 IF SY-SUBRC <> 0.
* Implement suitable error handling here
 ENDIF.