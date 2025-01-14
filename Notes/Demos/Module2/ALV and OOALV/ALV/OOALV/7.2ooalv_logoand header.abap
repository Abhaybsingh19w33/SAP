*&--------------------
1) The code in green is std code. Just copy paste the code
2) Code in yellow should be replaced by the name of the image uploaded.-------------------------------------------------*
*& Report
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZNT_OOALV_8.
INCLUDE ZNT_OOALV_SPLIT_IMG.

SELECTION-SCREEN: BEGIN OF BLOCK B1.
SELECT-OPTIONS: S_CARRID FOR LV_CARRID.
SELECTION-SCREEN: END OF BLOCK B1.

START-OF-SELECTION.
    PERFORM GET_DATA.
    PERFORM FIELD_FILLCAT.
    CALL SCREEN 1001.

*&---------------------------------------------------------------------*
*& Form GET_DATA
*&---------------------------------------------------------------------*
* text
*----------------------------------------------------------------------*
* --> p1 text
* <-- p2 text
*----------------------------------------------------------------------*
FORM GET_DATA .
    SELECT CARRID
            CONNID
            FLDATE
            PRICE
            CURRENCY
            PLANETYPE
    FROM SFLIGHT INTO TABLE IT_SFLIGHT WHERE CARRID IN S_CARRID.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form FIELD_FILLCAT
*&---------------------------------------------------------------------*
* text
*----------------------------------------------------------------------*
* --> p1 text
* <-- p2 text
*----------------------------------------------------------------------*
FORM FIELD_FILLCAT .
    "CARRID
    WA_FCAT-COL_POS = '1'.
    WA_FCAT-COLTEXT = 'Airline Code'.
    WA_FCAT-FIELDNAME = 'CARRID'.
    WA_FCAT-TABNAME = 'IT_SFLIGHT'.
    APPEND WA_FCAT TO IT_FCAT.
    "CONNID
    WA_FCAT-COL_POS = '2'.
    WA_FCAT-COLTEXT = 'Flight no'.
    WA_FCAT-FIELDNAME = 'CONNID'.
    WA_FCAT-TABNAME = 'IT_SFLIGHT'.
    APPEND WA_FCAT TO IT_FCAT.
    "FLDAT
    WA_FCAT-COL_POS = '3'.
    WA_FCAT-COLTEXT = 'Flight date'.
    WA_FCAT-FIELDNAME = 'FLDATE'.
    WA_FCAT-TABNAME = 'IT_SFLIGHT'.
    APPEND WA_FCAT TO IT_FCAT.
    "PRICE
    WA_FCAT-COL_POS = '4'.
    WA_FCAT-COLTEXT = 'Airfare'.
    WA_FCAT-FIELDNAME = 'PRICE'.
    WA_FCAT-TABNAME = 'IT_SFLIGHT'.
    APPEND WA_FCAT TO IT_FCAT.
    "CURRENCY
    WA_FCAT-COL_POS = '5'.
    WA_FCAT-COLTEXT = 'Currency'.
    WA_FCAT-FIELDNAME = 'CURRENCY'.
    WA_FCAT-TABNAME = 'IT_SFLIGHT'.
    APPEND WA_FCAT TO IT_FCAT.
    "PLANE TYPE
    WA_FCAT-COL_POS = '6'.
    WA_FCAT-COLTEXT = 'Airtype'.
    WA_FCAT-FIELDNAME = 'PLANETYPE'.
    WA_FCAT-TABNAME = 'IT_SFLIGHT'.
    APPEND WA_FCAT TO IT_FCAT.
ENDFORM.
*&---------------------------------------------------------------------*
*& Module STATUS_1001 OUTPUT
*&---------------------------------------------------------------------*
* text
*----------------------------------------------------------------------*
MODULE STATUS_1001 OUTPUT.
    SET PF-STATUS SPACE.
    * SET TITLEBAR 'xxx'.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Module USER_COMMAND_1001 INPUT
*&---------------------------------------------------------------------*
* text
*----------------------------------------------------------------------*
MODULE USER_COMMAND_1001 INPUT.
    CASE SY-UCOMM.
        WHEN 'EXIT' .
        LEAVE TO SCREEN 0.
    ENDCASE.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Module OOALV_DISP OUTPUT
*&---------------------------------------------------------------------*
* text
*----------------------------------------------------------------------*
MODULE OOALV_DISP OUTPUT.
    IT_LAYOUT-ZEBRA = 'X'.
    IT_LAYOUT-GRID_TITLE = 'LOGO DETAILS'.
    IT_LAYOUT-NO_TOOLBAR = 'X'.

    CREATE OBJECT IT_CONTAINER
        EXPORTING
        CONTAINER_NAME = 'CNT1'        .
    IF SY-SUBRC <> 0.
    ENDIF.

    CREATE OBJECT I_GRID
        EXPORTING
        I_PARENT = IT_CONTAINER
        .
    IF SY-SUBRC <> 0.
    ENDIF.

    I_GRID->SET_TABLE_FOR_FIRST_DISPLAY(
    EXPORTING
*       I_STRUCTURE_NAME = 'TY_TAB'
        IS_LAYOUT = IT_LAYOUT
    CHANGING
        IT_OUTTAB = IT_SFLIGHT
        IT_FIELDCATALOG = IT_FCAT ).
    IF SY-SUBRC <> 0.
    ENDIF.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Module OOALV_LOGO_DISP OUTPUT
*&---------------------------------------------------------------------*
* text
*----------------------------------------------------------------------*
MODULE OOALV_LOGO_DISP OUTPUT.
    TABLES STXH.
    DATA:   L_GRAPHIC_XSTR1 TYPE XSTRING,
            L_GRAPHIC_CONV1 TYPE I,
            L_GRAPHIC_OFFS1 TYPE I.
    DATA :  GRAPHIC_SIZE1 TYPE I,
*   GRAPHIC_TABLE1 TYPE STANDARD TABLE OF string,
            H_PICTURE1 TYPE REF TO CL_GUI_PICTURE,
            H_PIC_CONTAINER1 TYPE REF TO CL_GUI_CUSTOM_CONTAINER,
            GRAPHICS_URLS(255),
            GRAPHIC_REFRESH1(1),
            G_RESULT1 TYPE I.

    DATA :  BEGIN OF GRAPHIC_TABLE1 OCCURS 0,
                LINE1(255) TYPE X,
            END OF GRAPHIC_TABLE1.

    CALL METHOD CL_SSF_XSF_UTILITIES=>GET_BDS_GRAPHIC_AS_BMP
    EXPORTING
        P_OBJECT = 'GRAPHICS'
        P_NAME = 'ZNTBIRD'
        P_ID = 'BMAP'
        P_BTYPE = 'BCOL' "(BMON = BLACK&WHITE, BCOL = COLOUR)
    RECEIVING
        P_BMP = L_GRAPHIC_XSTR1
    EXCEPTIONS
        NOT_FOUND = 1
        OTHERS = 2.

    GRAPHIC_SIZE1 = XSTRLEN( L_GRAPHIC_XSTR1 ).
    CHECK GRAPHIC_SIZE1 > 0.

    L_GRAPHIC_CONV1 = GRAPHIC_SIZE1.
    L_GRAPHIC_OFFS1 = 0.

    WHILE L_GRAPHIC_CONV1 > 255.
        GRAPHIC_TABLE1-LINE1 = L_GRAPHIC_XSTR1+L_GRAPHIC_OFFS1(255).
        APPEND GRAPHIC_TABLE1.
        L_GRAPHIC_OFFS1 = L_GRAPHIC_OFFS1 + 255.
        L_GRAPHIC_CONV1 = L_GRAPHIC_CONV1 - 255.
    ENDWHILE.

    GRAPHIC_TABLE1-LINE1 = L_GRAPHIC_XSTR1+L_GRAPHIC_OFFS1(L_GRAPHIC_CONV1).
    APPEND GRAPHIC_TABLE1.

    CALL FUNCTION 'DP_CREATE_URL'
    EXPORTING
        TYPE = 'IMAGE' "#EC NOTEXT
        SUBTYPE = CNDP_SAP_TAB_UNKNOWN " 'X-UNKNOWN'
        SIZE = GRAPHIC_SIZE1
        LIFETIME = CNDP_LIFETIME_TRANSACTION "'T'
    TABLES
        DATA = GRAPHIC_TABLE1
    CHANGING
        URL = GRAPHICS_URLS
    EXCEPTIONS
*       DP_INVALID_PARAMETER = 1
*       DP_ERROR_PUT_TABLE = 2
*       DP_ERROR_GENERAL = 3
        OTHERS = 4.
    IF SY-SUBRC <> 0.
        MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
        WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
        EXIT.
    ENDIF.

    CREATE OBJECT H_PIC_CONTAINER1
    EXPORTING
        CONTAINER_NAME = 'CNT2'. "Container name in Layout

    CREATE OBJECT H_PICTURE1 EXPORTING PARENT = H_PIC_CONTAINER1.

    CALL METHOD H_PICTURE1->LOAD_PICTURE_FROM_URL
    EXPORTING
        URL = GRAPHICS_URLS
    IMPORTING
        RESULT = G_RESULT1.
ENDMODULE.