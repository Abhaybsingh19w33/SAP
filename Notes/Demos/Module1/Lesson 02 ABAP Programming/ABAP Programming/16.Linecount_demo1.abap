REPORT z  NO STANDARD PAGE HEADING LINE-COUNT 20.
"DO 80 TIMES. "Does not change the sy-pagno
                "If line-count is not given
DO 80 TIMES. 
  WRITE : / 'IN lOOP sy-pagno:', sy-pagno.
  WRITE :  'IN lOOP sy-INDEX:', SY-INDEX.
ENDDO.