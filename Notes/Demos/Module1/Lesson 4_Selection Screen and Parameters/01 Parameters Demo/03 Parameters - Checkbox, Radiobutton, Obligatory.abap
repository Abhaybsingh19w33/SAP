REPORT z.
parameters:
   p1	like sflight-carrid,
   p2	like p1 obligatory lower case," by default is in upercase.
   p3	like sy-datum default sy-datum,
   
   cb1 as checkbox,
   cb2 as checkbox,
   
   rb1 radiobutton group g1,
   rb2 radiobutton group g1,
   rb3 radiobutton group g1,

   rb4 radiobutton group g2,
   rb5 radiobutton group g2,
   rb6 radiobutton group g2.

CONSTANTS mark VALUE 'X'.

write:   'You entered:', 
         /'  p1  = ',  p1 ,
         /'  p2  = ',  p2 ,
         /'  p3  = ',  p3 ,
         /'  cb1 = ', cb1 ,
         /'  cb2 = ', cb2 ,
         /'  rb1 = ', rb1 ,
         /'  rb2 = ', rb2 ,
         /'  rb3 = ', rb3 ,
         /'  rb4 = ', rb4 ,
         /'  rb5 = ', rb5 ,
         /'  rb6 = ', rb6 .

IF CB1 = 'X'.
   WRITE :/ 'CB1 is selected'.
ENDIF.
IF CB2 = 'X'.
   WRITE:/ 'CB2 is selected'.
ENDIF.

if rb1 = 'X'.
   write 'RB1 is selected'.
ELSEIF rb2 = 'X'.
   write 'RB2 is selected'.
ELSEIF rb3 = 'X'.
   write 'RB3 is selected'.
endif.

CASE MARK. "if mark = 'X' where X  indicates selected
  WHEN RB4.
    WRITE :/ 'RB4 is selected'.
  WHEN RB5.
    WRITE :/ 'RB5 is selected'.
  WHEN RB6.
    WRITE :/ 'RB6 is selected'.
ENDCASE.