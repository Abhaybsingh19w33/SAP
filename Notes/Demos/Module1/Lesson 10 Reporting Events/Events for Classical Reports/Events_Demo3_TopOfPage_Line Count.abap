REPORT Z LINE-COUNT 5 NO STANDARD PAGE HEADING.
TOP-OF-PAGE.
    WRITE /'This is top of page event'.

START-OF-SELECTION.
    WRITE: / 'The line count is', SY-LINCT.
    WRITE /'Line 1'.
    WRITE /'Line 2'.
    WRITE /'Line 3'.
    WRITE /'Line 4'.
    WRITE /'Line 5'.
    WRITE /'Line 6'.
    WRITE /'Line 7'.
    WRITE /'Line 8'.
    WRITE /'Line 9'.
    WRITE /'Line 10'.
    WRITE /'Line 11'.
    WRITE /'Line 12'.
    WRITE /'Line 13'.
    WRITE /'Line 14'.
    WRITE /'Line 15'.

INITIALIZATION.
    WRITE /'This is initialization event'.