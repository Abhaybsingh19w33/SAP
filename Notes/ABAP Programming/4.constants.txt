REPORT z.

DATA v1 TYPE i VALUE 100.   "////(like int a=100)
"Here V1 is initialized with 100
WRITE / v1.
v1 = 200.
WRITE / v1.

CONSTANTS: pie TYPE f VALUE '3.14'.
WRITE / pie.
"pie ='3.14'.  "cannot be modified