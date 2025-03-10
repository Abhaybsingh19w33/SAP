REPORT  ZAT_ADOBEFORM_01.
TYPES: TY_OUTPUTPARAMS TYPE SFPOUTPUTPARAMS,
       TY_DOCPARAMS    TYPE SFPDOCPARAMS.

DATA WA_OUTPUTPARAMS TYPE SFPOUTPUTPARAMS.
DATA WA_DOCPARAMS    TYPE SFPDOCPARAMS.
DATA GV_FM_NAME      TYPE RS38L_FNAM.

wa_outputparams-DEVICE = 'PRINTER'.
wa_outputparams-DEST  = 'LP01'.
wa_outputparams-NODIALOG = 'X'.
wa_outputparams-PREVIEW  = 'X'.

CALL FUNCTION 'FP_JOB_OPEN'
  CHANGING
    IE_OUTPUTPARAMS       = wa_outputparams
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
    I_NAME                     = 'ZAT_ADFORM_03'
 IMPORTING
   E_FUNCNAME                 = GV_FM_NAME
*   E_INTERFACE_TYPE           =
*   EV_FUNCNAME_INBOUND        =
          .

wa_docparams-langu = 'E'.
wa_docparams-country = 'IN'.

CALL FUNCTION GV_FM_NAME
  EXPORTING
*   /1BCDWB/DOCPARAMS        =
    LV_NAME                  = 'Alphy'
* IMPORTING
*   /1BCDWB/FORMOUTPUT       =
* EXCEPTIONS
*   USAGE_ERROR              = 1
*   SYSTEM_ERROR             = 2
*   INTERNAL_ERROR           = 3
*   OTHERS                   = 4
          .
IF SY-SUBRC <> 0.
* Implement suitable error handling here
ENDIF.

CALL FUNCTION 'FP_JOB_CLOSE'
* IMPORTING
*   E_RESULT             =
* EXCEPTIONS
*   USAGE_ERROR          = 1
*   SYSTEM_ERROR         = 2
*   INTERNAL_ERROR       = 3
*   OTHERS               = 4
          .
IF SY-SUBRC <> 0.
* Implement suitable error handling here
ENDIF.