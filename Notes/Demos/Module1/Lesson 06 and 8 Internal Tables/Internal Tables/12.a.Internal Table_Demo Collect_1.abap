REPORT  z_test002.
types: begin of ittype ,
        sales type p decimals 2,
        name(10) TYPE c,
        date type d,
       end of ittype.

data : it type standard table of ittype initial size 3 ,
       wa type ittype .

wa-date = '19980101'. wa-sales = 100. wa-name	=  'jack'.
collect wa into it.
wa-date = '19980101'. wa-sales = 400. wa-name	=  'jack'.
collect wa into it..
wa-date = '19980101'. wa-sales = 300. wa-name	=  'jack'.
collect wa into it.
wa-date = '19980102'. wa-sales = 700. wa-name	=  'jack'.
collect wa into it.


wa-date = '19980101'. wa-sales = 200. wa-name	=  'jim'.
collect wa into it.
wa-date = '19980101'. wa-sales = 500. wa-name	=  'jim'.
collect wa into it.

wa-date = '19980101'. wa-sales = 600. wa-name	=  'jane'.
collect wa into it.
wa-date = '19980101'. wa-sales = 500. wa-name	=  'jane'.
collect wa into it.

wa-date = '19980102'. wa-sales = 600. wa-name	=  'jane'.
collect wa into it.
wa-date = '19980102'. wa-sales = 500. wa-name	=  'jane'.
collect wa into it.


LOOP AT it into wa.
   	WRITE: /  wa-date, wa-name, wa-sales.
ENDLOOP.
