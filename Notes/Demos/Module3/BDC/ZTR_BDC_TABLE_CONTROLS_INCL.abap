*&---------------------------------------------------------------------*
*&  Include           ZTR_BDC_TABLE_CONTROLS_INCL
*&---------------------------------------------------------------------*


TYPES : BEGIN OF TY_TAB1,
          LIFNR(10),        "TYPE LFA1-LIFNR,
          EKORG(4),         "TYPE RF02K-EKORG,
          KTOKK(4),         "TYPE LFA1-KTOKK,
          ANRED(15),        "TYPE LFA1-ANRED,
          NAME1(35),        "TYPE LFA1-NAME1,
          SORTL(10),        " TYPE LFA1-SORTL,
          LAND1(3),         "TYPE LFA1-LAND1,
          SPRAS(1),         "TYPE LFA1-SPRAS,

        END OF TY_TAB1.

DATA : IT_TAB1 TYPE STANDARD TABLE OF TY_TAB1,
       WA_TAB1 TYPE TY_TAB1.

TYPES : BEGIN OF TY_TAB2,
          LIFNR(10),           "TYPE LFA1-LIFNR,
          BANKS(3),            "TYPE LFBK-BANKS,
          BANKL(15),           "TYPE LFBK-BANKL,
          BANKN(18),           " TYPE LFBK-BANKN,
          KOINH(60),           " TYPE LFBK-KOINH,
          BKONT(2),            " TYPE LFBK-BKONT,


        END OF TY_TAB2.

DATA : IT_TAB2 TYPE STANDARD TABLE OF TY_TAB2,
       WA_TAB2 TYPE TY_TAB2.


DATA : IT_BDCDATA  TYPE BDCDATA OCCURS 0 WITH HEADER LINE .

PARAMETERS : P_FILE1 TYPE RLGRAP-FILENAME,
             P_FILE2 TYPE RLGRAP-FILENAME.

DATA : P TYPE STRING,
       Q TYPE STRING,
       R TYPE STRING,
       S TYPE STRING,
       T TYPE STRING,
       U TYPE STRING,
       N TYPE C,
       NUM TYPE I.
       N = NUM.