REPORT Z.
*CONTINUE Terminating the Loop Pass Unconditionally
*1) To terminate a loop pass immediately without any *condition, use the CONTINUE statement as follows:

DO 4 TIMES.
   IF SY-INDEX = 2.
      CONTINUE.
   ENDIF.
   WRITE SY-INDEX.
ENDDO.

*This produces the following output:
*
*         1          3          4
*
*Here, the system terminates the second loop pass without processing the WRITE statement
*
