REPORT z.

DATA CHOICE TYPE C VALUE 'N'.

START-OF-SELECTION.
WRITE /'This is the first statement in Start of Selection event'.
WRITE /'This is the second statement in Start of Selection event'.
WRITE /'This is the third statement in Start of Selection event'.
WRITE /'This is the fourth statement in Start of Selection event'.
WRITE /'This is the fifth statement in Start of Selection event'.


INITIALIZATION.
WRITE /'This is the first statement in initialization event'.
WRITE /'This is the second statement in initialization event'.
WRITE /'This is the third statement in initialization event'.
CHECK CHOICE = 'Y'.
"IF THE CONDITION IS NOT SATISFIED, EXITS THE EVENT BLOCK
WRITE /'This is the fourth statement in initialization event'.
WRITE /'This is the fifth statement in initialization event'.

LOAD-OF-PROGRAM.
WRITE 'This is load of program event'.