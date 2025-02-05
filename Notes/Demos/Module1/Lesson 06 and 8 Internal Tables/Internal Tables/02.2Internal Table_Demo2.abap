REPORT Z104329PGM1.
*1)
"begin of with occurs clause creates
*default header line
data : begin of stud1 occurs 0,
         rollno type i,
         name(10) type c,
       end of stud1.

*2)
"begin of with occurs clause
*creates default header line
data : begin of stud2  occurs 0 ,
        rollno type i,
        name(10) type c,
   end of stud2.
data: wa2 like  stud2.

*3)
types : begin of ty_stud,
        rollno type i,
        name(10) type c,
   end of ty_stud.
data: stud3 type standard table of ty_stud.
data: wa3   type  ty_stud. "recommended
*data: wa3 LIKE LINE OF stud3.

*PERFORM addanddispstud1.
*PERFORM addanddispstud2.
PERFORM addanddispstud3.
*------------------------------------------------------

FORM addanddispstud1.
   stud1-rollno = 10. stud1-name = 'Ram'.
   append stud1.
   "same as append stud1 to stud1.
   stud1-rollno = 20. stud1-name = 'Shyam'.
   append stud1.
   stud1-rollno = 30. stud1-name = 'Krishna'.
   append stud1.
   LOOP AT STUD1.
      WRITE : / sy-tabix , STUD1-ROLLNO , STUD1-NAME.
   ENDLOOP.
ENDFORM.

FORM addanddispstud2.
   wa2-rollno = 10. wa2-name = 'Ram'.
   append wa2 to stud2.

   wa2-rollno = 20. wa2-name = 'Shyam'.
   append wa2 to stud2.

   wa2-rollno = 30. wa2-name = 'Krishna'.
   append wa2 to stud2.

   LOOP AT STUD2 into wa2.
      WRITE : / sy-tabix, wa2-ROLLNO , wa2-NAME.
   ENDLOOP.
ENDFORM.

FORM addanddispstud3.
   wa3-rollno = 10. wa3-name = 'Ram'.
   append wa3 to stud3.
   wa3-rollno = 20. wa3-name = 'Shyam'.
   append wa3 to stud3.
   wa3-rollno = 30. wa3-name = 'Krishna'.
   append wa3 to stud3.
   LOOP AT STUD3 into wa3.
      WRITE : / sy-tabix, wa3-ROLLNO , wa3-NAME.
   ENDLOOP.
ENDFORM.




*-----------------------------------------------------------------