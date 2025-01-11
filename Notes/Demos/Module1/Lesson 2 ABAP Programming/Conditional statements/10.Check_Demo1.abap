REPORT z.
* The check statement is a conditional continue statement.
* If the expression is true, it does nothing.
* If it is false, it jumps to the end of the loop
* In the first case sy-index is one
* Check condition is NOT True(i.e sy-index is not between 3 and 8)
* Hence it does jump to the end of the loop
* Similarly for 2
* When sy-index is 3
* check sy-index between 3 and 8 is TRUE
* because sy-index is between 3 and 8.
* Hence it writes it  i.e. 3
* Similarly for 4 5 6 7 8


do 10 times.
  check  sy-index between 3 and 8.
  write sy-index. "output is 345678
enddo.