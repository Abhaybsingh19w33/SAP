REPORT  Z.
*Offset +
*length ()
DATA: VAR(7),
      DAT(7).

VAR  = 'BOY'.
DAT  = 'BIG'.

VAR+0(1)  = 'T'.
WRITE / VAR.    "output is TOY

var = var+0(1). 
write / var.    " output is T

*VAR NOW CONTAINS TOY
VAR(1)  = 'J'.  "same as VAR+0(1)
WRITE / VAR.    "output is JOY
*VAR NOW CONTAINS JOY

VAR(1)  = DAT.    
"same as var(1) = dat(1) 
"i.e same as var+0(1) = dat+0(1)
WRITE / VAR.    "output is BOY
*VAR NOW CONTAINS BOY

VAR+4  = VAR.   "same as var+4(3) = var(3)
WRITE / VAR.    "output is BOY BOY

*VAR NOW CONTAINS BOY BOY
*DAT CONTAINS BIG

VAR(3)  = DAT(3).   "same as var+0(3) = dat+0(3)
WRITE / VAR.    "output is BIG BOY