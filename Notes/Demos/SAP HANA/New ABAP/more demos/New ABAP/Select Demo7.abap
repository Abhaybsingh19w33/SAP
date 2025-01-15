REPORT Z.

TYPES: BEGIN OF wa, 
        fldate TYPE sbook-fldate, 
        count  TYPE i, 
        avg    TYPE p DECIMALS 2, 
        max    TYPE p DECIMALS 2, 
      END OF wa. 
DATA  itab TYPE TABLE OF wa WITH EMPTY KEY. 

SELECT fldate, COUNT( * ), AVG( luggweight ), MAX( luggweight ) 
       FROM sbook 
       WHERE carrid = 'LH' AND 
             connid = '0400' 
       GROUP BY fldate 
       INTO TABLE @itab. 

cl_demo_output=>display( itab ). 