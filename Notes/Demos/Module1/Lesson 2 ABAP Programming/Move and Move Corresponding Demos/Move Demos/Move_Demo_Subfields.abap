REPORT Z.
*Subscript starts from 0
DATA : FNAME(6)  TYPE C VALUE 'ABCDEF',
       MNAME(5)  TYPE C VALUE 'GHIJK',
       LNAME(10) TYPE C VALUE 'LMNOPQRSTUVWXYZ'.

MOVE MNAME+2 TO LNAME. 
"Implies starting from 3rd position(I)
"all will be copied to lname
WRITE:/ 'lname is:', LNAME. "IJK

MOVE MNAME(3) TO LNAME. 
"Implies starting from 0th position 3 length                                "will be copied to lname
WRITE:/ 'lname is:', LNAME. "GHI

MOVE MNAME+1(2) TO LNAME.   
"Implies starting from 2nd position(H)
"2 lenght will be copied to lname
WRITE:/ 'lname is:', LNAME. "HI