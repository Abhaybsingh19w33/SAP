REPORT z.
types: begin of it_typ,
  f1  TYPE i,
  end of it_typ.

data : it type standard table of it_typ 
       WITH HEADER LINE INITIAL SIZE  0.
"data : it type standard table of it_typ  INITIAL SIZE  0. 
"data wa type it_typ.

do  3 times.
  it-f1 = sy-index.
  append it.
enddo.
*PERFORM dispinttab.

*PERFORM freeinttab.
*PERFORM dispinttab.

*PERFORM clearinttab.
*PERFORM dispinttab.

PERFORM refreshinttab.
PERFORM dispinttab.
if it is initial.
  write:/ 'no rows exist in it.'.
ENDIF.


FORM dispinttab.
  write:/ 'In dispinttab'.
  loop at it.
write: / 'it-f1:' , it-f1.
  endloop.
  
ENDFORM.  

form freeinttab.
free it.
write :/'it-f1 in free after freeing the HL:' ,it-f1.
free it[].
write :/'it-f1 in free after freeing the body:' ,it-f1.
endform.

FORM clearinttab.
clear it.
write :/'it-f1 in clear after clearing the HL:' ,it-f1.
clear it[].
write :/'it-f1 in clear after clearing the body:' ,it-f1.
endform.

FORM  refreshinttab.
refresh it.
write :/'it-f1 in after refreshing the HL:' ,it-f1.
refresh it[].
write :/'it-f1 in after refreshing the body:' ,it-f1.
endform.