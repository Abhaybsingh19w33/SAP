REPORT  ZVKPRG3.
* Key is deptno
*Non key components have to be numeric
types: begin of emptype,
   deptno type z104329emp-deptno,
   sal type z104329emp-sal,
   comm type z104329emp-comm,
end of   emptype. 
DATA: itemp1 type STANDARD TABLE OF emptype 
       INITIAL SIZE 0,
      itemp2 type STANDARD TABLE OF emptype
       INITIAL SIZE 0,
      wa1 type  emptype,
      wa2 type  emptype.

perform selectfromdb.
perform collectit.
perform dispinttable.

form selectfromdb.
  select deptno sal comm
      from z104329emp
    into table itemp1.
endform.  

form collectit.
loop at itemp1  into wa1.
  collect  wa1 into itemp2. 
ENDLOOP.
endform.

form dispinttable.
 loop at itemp2  into wa2.
   write:/ wa2-deptno , wa2-sal,
   wa2-comm.
  endloop.

endform.