report z.
Types: begin of it1_ty ,
        f1,
        f2(2),
       end of it1_ty.

DATA: it TYPE STANDARD TABLE OF it1_ty  INITIAL SIZE 0,
      wa TYPE It1_ty.                  "work area

start-of-selection.
wa-f1 = 'A'.
wa-f2 = 'XX'.
append wa to it.          "appends work area to body IT
write: / 'sy-tabix = ', sy-tabix.

wa-f1 = 'B'.
wa-f2 = 'YY'.
append wa to it.          "appends work area IT to body IT
write: / 'sy-tabix = ', sy-tabix.

wa-f1 = 'C'.
append  wa to it.         "the internal table now contains three rows
write: / 'sy-tabix = ', sy-tabix. 

append  wa to it.
			"the internal table now contains four rows
write: / 'sy-tabix = ', sy-tabix.
LOOP AT IT INTO WA.
    WRITE : / WA-F1,
       WA-F2.
ENDLOOP.    