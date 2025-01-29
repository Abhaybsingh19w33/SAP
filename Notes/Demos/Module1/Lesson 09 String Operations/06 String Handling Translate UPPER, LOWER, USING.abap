REPORT Z.
DATA : ALPHA(10) VALUE 'abcd12'.
* a->A : B->c : 1->2
TRANSLATE ALPHA USING 'aABc12'.
WRITE ALPHA.
*	Will output Abcd22.
*---------------------------------------------

REPORT Z.
DATA: t(10)    TYPE C VALUE 'AbCdEfGhIj',
      STR      LIKE T,
      RULE(20) TYPE C VALUE 'AxbXCydYEzfZ'.

STR = T.
SKIP.
WRITE STR.

*TRANSLATE STR TO UPPER CASE.
*WRITE STR.

*STR = T.
*TRANSLATE STR TO LOWER CASE.
*WRITE STR.

STR = T.
TRANSLATE STR USING RULE.
WRITE / STR.
**  Output:
**  AbCdEfGhIj
**  ABCDEFGHIJ
**  abcdefghij
**  xXyYzZGhI