*&---------------------------------------------------------------------*
*& Report ZAPPLY_LOCK_OBJECTS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZAPPLY_LOCK_OBJECTS.

PARAMETERS p_matnr type matnr.

CALL FUNCTION 'ENQUEUE_EZMARA'
 EXPORTING
*   MODE_MARA            = 'E'
*   MANDT                = SY-MANDT
   MATNR                =  p_matnr
*   X_MATNR              = ' '
*   _SCOPE               = '2'
*   _WAIT                = ' '
*   _COLLECT             = ' '
* EXCEPTIONS
*   FOREIGN_LOCK         = 1
*   SYSTEM_FAILURE       = 2
*   OTHERS               = 3
          .
IF SY-SUBRC <> 0.
* Implement suitable error handling here
ENDIF.

UPDATE mara set matkl = '0001' where matnr = p_matnr.

CALL FUNCTION 'DEQUEUE_EZMARA'
* EXPORTING
*   MODE_MARA       = 'E'
*   MANDT           = SY-MANDT
*   MATNR           =
*   X_MATNR         = ' '
*   _SCOPE          = '3'
*   _SYNCHRON       = ' '
*   _COLLECT        = ' '
          .