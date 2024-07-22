1) create a Report in se38 with the below code.

2) Create a text file with the following data
zxyz13	kuna	name1	sear1	123456	mumbai	123456	IN
zxyz14	kuna	name1	sear1	123456	mumbai	123456	IN
zxyz15	kuna	name1	sear1	123456	mumbai	123456	IN
zxyz17	kuna	name1	sear1	123456	mumbai	123456	IN




*&---------------------------------------------------------------------*
*& Report ZRTC_BDC_CUSTOMER
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*

REPORT zrtc_bdc_customer.

TABLES : kna1.
TYPES : BEGIN OF ty_kna1,
          kunnr TYPE kunnr,
          ktokd TYPE ktokd,
          name1 TYPE kunnr,
          sortl TYPE sortl,
          pfach TYPE pfach,
          ort01 TYPE ort01_gp,
          pstl2 TYPE pstl2,
          land1 TYPE land1_gp,


        END OF ty_kna1.

DATA : it_kna1 TYPE TABLE OF ty_kna1,
       wa_kna1 TYPE ty_kna1.

DATA : it_bdcdata TYPE  bdcdata OCCURS 0  WITH HEADER LINE .

PARAMETERS : p_file TYPE rlgrap-filename.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_file.

  CALL FUNCTION 'F4_FILENAME'
    EXPORTING
      program_name  = syst-cprog
      dynpro_number = syst-dynnr
*     FIELD_NAME    = 'P_FILE'
    IMPORTING
      file_name     = p_file.


START-OF-SELECTION.
  DATA : p_file_str TYPE string.

  p_file_str = p_file.

  CALL FUNCTION 'GUI_UPLOAD'
    EXPORTING
      filename            = p_file_str
      filetype            = 'ASC'
      has_field_separator = 'X'
    TABLES
      data_tab            = it_kna1

    .
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.


  CALL FUNCTION 'BDC_OPEN_GROUP'
    EXPORTING
      client = sy-mandt
      group  = 'ZRTC_GRP'  " to be executed in sm35
      keep   = 'X'
      user   = sy-uname.
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.

  LOOP AT it_kna1 INTO wa_kna1.


    PERFORM bdc_dynpro      USING 'SAPMF02D' '0100'.
    PERFORM bdc_field       USING 'BDC_CURSOR'
                                  'RF02D-KTOKD'.
    PERFORM bdc_field       USING 'BDC_OKCODE'
                                  '/00'.
    PERFORM bdc_field       USING 'RF02D-KUNNR'
                                                wa_kna1-kunnr.
*                              'zabcdef'.
    PERFORM bdc_field       USING 'RF02D-KTOKD'
*                              'KUNA'.
                                                wa_kna1-ktokd.
    PERFORM bdc_dynpro      USING 'SAPMF02D' '0110'.
    PERFORM bdc_field       USING 'BDC_CURSOR'
                                  'KNA1-SPRAS'.
    PERFORM bdc_field       USING 'BDC_OKCODE'
                                  '=UPDA'.
    PERFORM bdc_field       USING 'KNA1-NAME1'
*                              ' rtc123457'.
                                                 wa_kna1-name1.
    PERFORM bdc_field       USING 'KNA1-SORTL'
*                              'STC12'.
                                                 wa_kna1-sortl.
    PERFORM bdc_field       USING 'KNA1-PFACH'
*                              '123456'.
                                                 wa_kna1-pfach.
    PERFORM bdc_field       USING 'KNA1-ORT01'
*                              'mumbai'.
                                                  wa_kna1-ort01.
    PERFORM bdc_field       USING 'KNA1-PSTL2'
                                                  wa_kna1-pstl2.
*                '123456'.
    PERFORM bdc_field       USING 'KNA1-LAND1'
*                                  'IN'.
                                                wa_kna1-land1.
    PERFORM bdc_field       USING 'KNA1-SPRAS'
                                  'EN'.



    CALL FUNCTION 'BDC_INSERT'
      EXPORTING
        tcode     = 'XD01'
      TABLES
        dynprotab = it_bdcdata.

    IF sy-subrc <> 0.
* Implement suitable error handling here
    ENDIF.

    REFRESH it_bdcdata.

  ENDLOOP.

  CALL FUNCTION 'BDC_CLOSE_GROUP'.
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.


  WRITE: 'GO TO SM35 T-CODE AND RUN THE SESSION FOR BDC.'.
*&---------------------------------------------------------------------*
*&      Form  BDC_DYNPRO
*&---------------------------------------------------------------------*

FORM bdc_dynpro  USING   p_program p_screen.
  CLEAR it_bdcdata.
  it_bdcdata-program = p_program.

  it_bdcdata-dynpro = p_screen.

  it_bdcdata-dynbegin = 'X'."continue button
  APPEND  it_bdcdata.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  BDC_FIELD
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_0093   text
*      -->P_0094   text
*----------------------------------------------------------------------*
FORM bdc_field  USING   p_fname
                         p_fvalue.
  CLEAR it_bdcdata.
  it_bdcdata-fnam = p_fname.
  it_bdcdata-fval = p_fvalue.
  APPEND it_bdcdata.

ENDFORM.