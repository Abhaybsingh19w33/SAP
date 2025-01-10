
REPORT z.

data todaydate(10) TYPE c.
"yyyymmdd
CONCATENATE  sy-datum+6(2) "date
               sy-datum+4(2) "month
               sy-datum(4) "year
               into todaydate
               SEPARATED BY '/'.

WRITE todaydate.