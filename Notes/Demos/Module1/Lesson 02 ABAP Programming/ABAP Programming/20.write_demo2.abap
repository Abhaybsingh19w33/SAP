report z.
data:  f1(4)    type p  value 1234,
          p     type i   value 5,
          l     type i   value 8.

write: / '-----+------1------+---',	"write out a ruler
       / '12345678901234567'.
write /(2)   'XYZ'.   "output is XY...Inside the brackets ---write that many contents 
*                                      Outside the bracket...write at that position.

write /(4)   'XYZ'.
write        'ABC'.
"output is XYZ ABC
write  /5(4)    f1 .   "output is         1234
write  at /p(1)  f1.   "output is        *       

" Note: Last write statement does not work as mentioned in the handout
" It just displays an *
" This is because at 5(1) i.e at 5th position there is nothing in f1