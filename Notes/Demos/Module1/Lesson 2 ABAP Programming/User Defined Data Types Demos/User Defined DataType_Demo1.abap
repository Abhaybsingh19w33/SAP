REPORT Z.
TYPES GENNAME(20) TYPE C. "USER DEFINED DATA TYPE
"cannot be assigned a value
DATA FIRSTNAME TYPE GENNAME VALUE 'Leena'.
DATA LASTNAME  TYPE GENNAME VALUE 'Agarwal'.
"DATA LNAME  LIKE GENNAME VALUE 'Agarwal'.
"Cannot use like in the above statement
WRITE: / FIRSTNAME, LASTNAME.