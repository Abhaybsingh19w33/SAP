REPORT Z.
DATA: CVAR1(7) TYPE C VALUE 'ABCD', "contains characters
      CVAR2(7) TYPE C VALUE '5678', "contains numbers
      IVAR1    TYPE I VALUE 1234,
      IVAR2    TYPE I VALUE 45.

CVAR1 = IVAR1. "allowed
IVAR1 = CVAR1. "not allowed if char contains characters
IVAR2 = CVAR2. "allowed if char contains numeric values
WRITE :/ 'After Move'.
WRITE:/  'CVAR1:' , CVAR1.
WRITE:/  'IVAR1:' , IVAR1.
WRITE:/  'IVAR2:' , IVAR2.