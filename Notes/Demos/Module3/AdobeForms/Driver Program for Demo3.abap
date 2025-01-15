REPORT ZVK1.
TABLES : ekpo.

TYPES: ty_outputparams type sfpoutputparams,
       ty_docparams type sfpdocparams.

data wa_outputparams type sfpoutputparams.

data wa_docparams type sfpdocparams.

DATA gv_fm_name type rs38l_fnam.

DATA : gv_ebeln TYPE ebeln,
       gv_ebelp TYPE ebelp,
       gv_matnr TYPE matnr,
       gv_werks TYPE ewerk,
       gv_bukrs TYPE bukrs.


*INCLUDE  ZCAP_FM_ADOBE2_PROGRAM_INCL.
*Above declaration of data and types can be put in include
PARAMETERS: p_ebeln type ebeln.

START-OF-SELECTION.

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
   I_NAME                     = 'ZVK_FM_ADOBE3'    " Adobe form name.
 IMPORTING
   E_FUNCNAME                 = gv_fm_name
*   E_INTERFACE_TYPE           =
*   EV_FUNCNAME_INBOUND        =
          .
wa_docparams-langu = 'E'.
wa_docparams-country = 'IN'.

SELECT SINGLE EBELN
       EBELP
       MATNR
       WERKS
       BUKRS FROM EKPO
       INTO (GV_EBELN, GV_EBELP, GV_MATNR, GV_BUKRS, GV_WERKS)
      WHERE EBELN EQ P_EBELN.

CALL FUNCTION gv_fm_name    " Call Adobe form generated function module
  EXPORTING
   /1BCDWB/DOCPARAMS        = wa_docparams
    EBELN                    = gv_ebeln
    EBELP                    = gv_ebelp
    MATNR                    = gv_matnr
    BUKRS                    = gv_bukrs
    WERKS                    = gv_werks
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