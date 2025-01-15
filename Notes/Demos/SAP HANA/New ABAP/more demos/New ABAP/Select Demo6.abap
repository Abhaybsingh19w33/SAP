REPORT Z.

DATA count TYPE i. 

SELECT COUNT( DISTINCT carrid ) 
       FROM spfli 
       WHERE cityto = 'NEW YORK' 
       INTO @count.
  
WRITE count.  