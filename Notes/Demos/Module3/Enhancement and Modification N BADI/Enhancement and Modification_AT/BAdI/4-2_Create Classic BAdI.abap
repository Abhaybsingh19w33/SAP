*&---------------------------------------------------------------------*
*& Report ZKBADICLASSIC
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZKBADICLASSIC.
TABLES MARA.
PARAMETERS P_MATNR TYPE MARA-MATNR.
DATA OBJ TYPE REF TO ZIF_EX_VKBADI.

DATA: IT_TAB TYPE ZVK_MARAMATKTT,
      WA_TAB TYPE MARA.

CALL METHOD CL_EXITHANDLER=>GET_INSTANCE
  EXPORTING
    EXIT_NAME                     =  'ZVKBADI'   " classic badi name
*    NULL_INSTANCE_ACCEPTED        = SEEX_FALSE
*  IMPORTING
*    ACT_IMP_EXISTING              =
  CHANGING
    INSTANCE                      = OBJ
*  EXCEPTIONS
*    NO_REFERENCE                  = 1
*    NO_INTERFACE_REFERENCE        = 2
*    NO_EXIT_INTERFACE             = 3
*    CLASS_NOT_IMPLEMENT_INTERFACE = 4
*    SINGLE_EXIT_MULTIPLY_ACTIVE   = 5
*    CAST_ERROR                    = 6
*    EXIT_NOT_EXISTING             = 7
*    DATA_INCONS_IN_EXIT_MANAGEM   = 8
*    OTHERS                        = 9
        .
IF SY-SUBRC <> 0.
* Implement suitable error handling here
ENDIF.

CALL METHOD OBJ->METH1
  EXPORTING
    I_MATNR = P_MATNR
  CHANGING
    C_MATNR  = IT_TAB
    .

LOOP AT IT_TAB INTO WA_TAB.
  WRITE : WA_TAB-MATNR,
          WA_TAB-MBRSH,
          WA_TAB-MTART.
ENDLOOP.