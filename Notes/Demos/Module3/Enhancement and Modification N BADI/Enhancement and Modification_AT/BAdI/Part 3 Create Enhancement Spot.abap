" Note: This does not work. Gives dump error.

REPORT ZVK1.
DATA RSUM TYPE I.
DATA OBJ TYPE REF TO ZIF_EX_VKBADI1.
CALL METHOD CL_EXITHANDLER=>GET_INSTANCE
 EXPORTING
    EXIT_NAME                     = 'ZVKBADI1'
*    NULL_INSTANCE_ACCEPTED        = SEEX_FALSE
*  IMPORTING
*    ACT_IMP_EXISTING              =
  CHANGING
    INSTANCE                      =    OBJ
  EXCEPTIONS
    NO_REFERENCE                  = 1
    NO_INTERFACE_REFERENCE        = 2
    NO_EXIT_INTERFACE             = 3
    CLASS_NOT_IMPLEMENT_INTERFACE = 4
    SINGLE_EXIT_MULTIPLY_ACTIVE   = 5
    CAST_ERROR                    = 6
    EXIT_NOT_EXISTING             = 7
    DATA_INCONS_IN_EXIT_MANAGEM   = 8
    OTHERS                        = 9
        .
IF SY-SUBRC <> 0.
* Implement suitable error handling here
ENDIF.

CALL METHOD OBJ->ADDNUM
  EXPORTING
    NUM1   =  '10'
    NUM2   =  '20'
  IMPORTING
    SUM    = rsum
    .
WRITE rsum.