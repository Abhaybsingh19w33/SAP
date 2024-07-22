*The check statement is a conditional continue statement.  
* If the expression is true, it does nothing. 
* If it is false, it jumps to the end of the loop 
* In the first case sy-index is one
* Check condition is True(i.e not sy-index between 3 and 8)
* Hence it does NOT jump to the end of the loop
* AND PRINTS 1
* Similarly for 2
* When sy-index is 3
* check not sy-index between 3 and 8 is FALSE  
* bacause sy-index is between 3 and 8.
* Hence it goes to end of loop
* Similarly for 4 5 6 7 8
* Then print 9,10

do 10 times.
	check not sy-index between 3 and 8.
	write sy-index.
enddo.

op 1 2 9 10