"REPORT Z. "
"REPORT Z LINE-SIZE 40. 
REPORT Z LINE-SIZE 60.

WRITE: 'SY-LINSZ:', SY-LINSZ. 
ULINE. 
DO 20 TIMES.                          
  WRITE sy-index. 
ENDDO.