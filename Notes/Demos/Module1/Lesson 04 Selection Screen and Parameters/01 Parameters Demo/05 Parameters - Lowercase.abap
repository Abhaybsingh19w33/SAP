REPORT Z.
PARAMETERS FNAME(30) TYPE C. "whatever the user enters will be converted to Upper case while displaying
PARAMETERS MNAME(30) TYPE C LOWER CASE. "will retain case while displaying

WRITE :/ 'Fname is :', FNAME.
WRITE :/ 'Mname is :', MNAME.