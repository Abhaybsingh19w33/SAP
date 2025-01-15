*"Switch case

"===========================================
**Classic approach

REPORT Z.

PARAMETERS P_DAY TYPE I .
*data v_day_name(10) type c.
*CASE p_day.
*  WHEN  1.
*      v_day_name = 'Monday'.
*  WHEN 2 .
*    v_day_name = 'Tuesday'.
*WHEN 4 .
*    v_day_name = 'Thursday'.
*WHEN 5 .
*    v_day_name = 'Friday'.
*WHEN 7 .
*    v_day_name = 'Sunday'.
*WHEN others .
*    v_day_name = 'Invalid day'.
*
*ENDCASE.
*
*write : / p_day , v_day_name COLOR 1.

"=============================================================
*New CASE Via SWITCH


DATA(LV_DAY) = SWITCH #( P_DAY
                  WHEN 1 THEN 'Monday    '
                  WHEN 2 THEN 'Tuesday'
                  WHEN 3 THEN 'wednesday'
                  WHEN 4 THEN 'Thursday'
                  WHEN 5 THEN 'Friday'
                  WHEN 6 THEN 'saturday'
                  WHEN 7 THEN 'sundday'
                  ELSE 'Invalid' ).

WRITE : / P_DAY,LV_DAY COLOR 7.