REPORT  Z.
PARAMETERS NUM1 TYPE I DEFAULT 10. "cannot give value for parameter
PARAMETERS NUM2 TYPE I.
DATA RES  TYPE I.

RES = NUM1 + NUM2.

WRITE: 'The Addition of ', Num1, 'And', Num2, 'is', Res.