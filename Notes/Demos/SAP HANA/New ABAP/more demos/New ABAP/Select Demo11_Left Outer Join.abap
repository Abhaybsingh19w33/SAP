REPORT Z.

*Reads all flights within the next 30 days. 

TYPES: BEGIN OF sflight_tab_type, 
         carrid TYPE sflight-carrid, 
         connid TYPE sflight-connid, 
         fldate TYPE sflight-fldate, 
       END OF sflight_tab_type. 

DATA: sflight_tab TYPE TABLE OF sflight_tab_type, 
      date        TYPE d. 

date = sy-datum + 30. 

SELECT carrid, connid, fldate 
       FROM sflight 
       WHERE fldate BETWEEN @sy-datum AND @date 
       INTO CORRESPONDING FIELDS OF TABLE @sflight_tab. 
cl_demo_output=>display( sflight_tab ). 


