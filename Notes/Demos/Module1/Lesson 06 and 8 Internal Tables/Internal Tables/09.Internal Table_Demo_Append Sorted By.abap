report z.
types: begin of it_t1 ,
        sales type p decimals 2,
        name(10),
        end of it_t1.
data : it type standard table of it_t1 initial size 3 ,
       wa type it_t1 .

wa-sales   =   100. wa-name  =  'Jack'.
append wa to it sorted by sales.
wa-sales   =  50. wa-name  =  'Jim'.
append wa to it  sorted by sales.
wa-sales   =  150. wa-name  =  'Jane'.
append wa to it  sorted by sales.
wa-sales   =  75. wa-name  =  'George'.
append wa  to it  sorted by sales.
wa-sales   =  200.wa-name  =  'Gina'.
append wa to it sorted by sales.
wa-sales   =  100. wa-name  =  'Jeff'.
append wa to it sorted by sales.

PERFORM  dispinttable.

form dispinttable.
  loop at it into wa.
    write: /  wa-sales, wa-name.
  endloop.
endform.