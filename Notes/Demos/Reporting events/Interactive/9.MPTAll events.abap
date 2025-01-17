REPORT z NO STANDARD PAGE HEADING.

TYPES: BEGIN OF scarrtype,
         carrid   TYPE scarr-carrid,
         carrname TYPE s_carrname,
         currcode TYPE s_currcode,
       END OF scarrtype.

TYPES: BEGIN OF spflitype,
         carrid   TYPE spfli-carrid,
         connid   TYPE s_conn_id,
         cityfrom TYPE s_from_cit,
         cityto   TYPE s_to_city,
       END OF spflitype.

TYPES: BEGIN OF sflighttype,
         carrid    TYPE sflight-carrid,
         connid    TYPE s_conn_id,
         fldate    TYPE s_date,
         price     TYPE s_price,
         planetype TYPE s_planetye,
       END OF sflighttype.

DATA itscarr TYPE TABLE OF scarrtype .
DATA itspfli  TYPE TABLE OF spflitype .
DATA itsflight  TYPE TABLE OF sflighttype.
DATA wascarr  TYPE scarrtype.
DATA waspfli LIKE LINE OF itspfli.
DATA wasflight TYPE sflighttype.
DATA field_name(15)  TYPE c.
DATA field_value(15) TYPE c.

TOP-OF-PAGE .
  WRITE 'Airline Details'.

TOP-OF-PAGE DURING LINE-SELECTION.
  IF sy-lsind = 1.
    WRITE 'SPFLI - Flight schedule'.
  ELSEIF  sy-lsind = 2.
    WRITE 'SFLIGHT - Flight Details'.
  ENDIF.

START-OF-SELECTION.
  PERFORM get_scarr.

AT LINE-SELECTION.
  IF sy-lsind = 1.
    PERFORM disp_spfli.
  ELSEIF sy-lsind = 2.
    PERFORM disp_sflight.
  ENDIF.

FORM get_scarr.
  SELECT carrid carrname currcode
  FROM scarr
  INTO TABLE itscarr.

  LOOP AT itscarr INTO wascarr.
    WRITE: / wascarr-carrid,
             wascarr-carrname,
             wascarr-currcode.
  ENDLOOP.
ENDFORM.

FORM disp_spfli.
  GET CURSOR FIELD field_name VALUE field_value.

  IF  field_name NE 'WASCARR-CARRID'.
    MESSAGE 'Select  the field carrid' TYPE 'E'.
  ELSE.
    SELECT carrid
           connid
           cityfrom
           cityto
       INTO TABLE itspfli
       FROM spfli
     WHERE carrid = field_value.

    LOOP AT itspfli INTO waspfli.
      WRITE:/ waspfli-carrid ,
              waspfli-connid ,
              waspfli-cityfrom,
             waspfli-cityto.
      HIDE waspfli.
    ENDLOOP.
  ENDIF.
ENDFORM.

FORM disp_sflight.
  SELECT carrid
         connid
         fldate
         price
         planetype
    INTO TABLE itsflight
     FROM sflight
     WHERE carrid = field_value
     AND connid = waspfli-connid.

  LOOP AT itsflight INTO wasflight.
    WRITE:/ wasflight-carrid ,
            wasflight-connid ,
            wasflight-fldate,
            wasflight-price,
            wasflight-planetype.
  ENDLOOP.
ENDFORM.