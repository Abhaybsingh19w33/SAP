REPORT  Z.
data : alpha(10) value 'abcdefg'.  
start-of-selection.                                  
*The SHIFT command
 write 'Testing the SHIFT command'. 
 write : / 'Intial ', 15 alpha.       
 shift alpha by 2 places right.     
 write : / 'Right ', 15 alpha.      
 shift alpha by 2 places left.      
 write : / 'Left ', 15 alpha.       
 shift alpha  by 2 places circular. 
 write : / 'Circular ', 15 alpha.

