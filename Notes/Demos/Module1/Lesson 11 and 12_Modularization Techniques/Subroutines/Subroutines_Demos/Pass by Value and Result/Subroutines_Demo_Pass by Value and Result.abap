REPORT Z.
DATA: F1 TYPE C VALUE 'A'.

WRITE: / 'Before invoking S2, F1 =', F1.
PERFORM S2 CHANGING F1.

WRITE: / 'After invoking  S2, F1 =', F1.

END-OF-SELECTION.
WRITE: / 'In EOS, After invoking S2, F1 =', F1.

FORM S2 CHANGING VALUE(P1).
*Above is pass by value and result
    P1 = 'X'.
    WRITE: / 'In Subroutine S2, P1 =', P1.
*stop statement terminates the subroutine and
*transfers control to the end-of-selection event.
    STOP.
ENDFORM.