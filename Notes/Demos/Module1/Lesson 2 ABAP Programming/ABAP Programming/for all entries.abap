DEMO for for all entries----------------------
---------------------------------------------

REPORT NO STANDARD PAGE HEADING LINE-COUNT 8(2).

TABLES :SFLIGHT.

SELECT-OPTIONS S_CARRID FOR SFLIGHT-CARRID.
DATA : IT_SFLIGHT TYPE  TABLE OF SFLIGHT.
DATA : IT_SCARR  TYPE  TABLE OF SCARR.
DATA :wa_SCARR  TYPE   SCARR.

"Fetch from one table(sflight)
SELECT * FROM  SFLIGHT INTO TABLE IT_SFLIGHT WHERE CARRID in S_CARRID.

"if it_Sflight is empty it will return all the elements from scarr.
if it_Sflight[] is  not initial.

"Fetch from second table(scarr)
   SELECT * FROM SCARR INTO TABLE IT_SCARR  FOR ALL ENTRIES IN IT_SFLIGHT
      WHERE CARRID = IT_SFLIGHT-CARRID.
endif.

loop at it_Scarr into wa_scarr.
   write : / wa_scarr-carrid,
             wa_scarr-carrname,
             wa_scarr-currcode.
endloop.