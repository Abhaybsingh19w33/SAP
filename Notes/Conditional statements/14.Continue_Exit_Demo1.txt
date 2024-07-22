REPORT Z.
*CONTINUE Terminating the Loop Pass Unconditionally
*
*CHECK     Terminating the Loop Pass Conditionally
*
*EXIT     Terminating a Loop Entirely (depends)
*
*
*1) To terminate a loop pass immediately without any condition, use the CONTINUE statement as follows:

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
*1A) When you apply this statement, system will pass a current loop. System  ignores any statements after CONTINUE statement and start to the next loop
*DO 4 TIMES.
*WRITE:/ sy-index.
*IF sy-index <= 2.
*CONTINUE.
*ENDIF.
*WRITE: ’After’.
*ENDDO.
*
*OP
*1
*2
*3   After
*4   After
*
*2) To terminate a loop pass conditionally, use the CHECK statement as follows:
*
*Syntax
*
*     CHECK <condition>.
*
*DO 4 TIMES.
*
*   CHECK SY-INDEX BETWEEN 2 and 3.
*
*   WRITE SY-INDEX.
*
*ENDDO.
*
*
*This produces the following output:
*
*         2          3
*
*Here, the system terminates the first and the fourth loop pass without processing the WRITE statement because SY-INDEX does not fall between 2 and 3.
*
*2A)This statement will apply if you want to check condition before go to next statement. If the result of checking is ’TRUE’, system will go to next step as normally. If the result of checking is ’FALSE’, system will operate look like CONTINUE statement
*
*DO 4 TIMES.
*WRITE:/ sy-index.
*CHECK sy-index > 2.
*WRITE: ’After’.
*ENDDO
*
*
*OP
*1
*2
*3   After
*4   After
*3) To terminate a loop entirely without any condition, use the EXIT statement as follows:
*
*Syntax
*
*          EXIT.
*
*DO 4 TIMES.
*
*   IF SY-INDEX = 3.
*
*      EXIT.
*
*   ENDIF.
*
*WRITE SY-INDEX.
*
*ENDDO.
*
*This produces the following output:
*
*         1          2
*
*Here, the system terminates the entire loop processing in the third loop pass without processing the WRITE statement or the fourth loop pass.
*
*