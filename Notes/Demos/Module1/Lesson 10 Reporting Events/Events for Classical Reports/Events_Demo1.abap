REPORT z.

END-OF-SELECTION.
    WRITE / '3. end-of-selection'.

START-OF-SELECTION.
    WRITE / '2. start-of-selection'.

INITIALIZATION.
    WRITE / '1. initialization'.

LOAD-OF-PROGRAM.
    WRITE 'This is load of program event'.

*The driver program fires the events according as per the events.
*i.e. the driver program will fire the Initialization event first, then at selection sceen, then start of selection , then end-of-selection.
*Even if we code initialization event after end-of-selection, the initialization event will be fired first.