REPORT Z.
*The split command is used to split a string at a given delimiter. The format is
*split <string> at <delimiter> into <f1> <f2> <f3>�.
DATA : STRING(40) VALUE 'hello what was that??',
       F1(10),
       F2(30),
       F3(30),
       F4(30).
SPLIT STRING AT ' ' INTO F1 F2.
*	F1 and f2 will contain �hello� and �what was that� respectively.
WRITE F1.
WRITE F2.

SPLIT STRING AT ' ' INTO F1 F2 F3 F4.

WRITE : / F1.
WRITE : / F2.
WRITE : / F3.
WRITE : / F4.