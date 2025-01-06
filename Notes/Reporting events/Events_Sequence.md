The events in ABAP are:
Classical Events: Or Events for Classical reports

1. load of program
2. Initilization : triggered when the report is loaded in memory.
3. At selection-screen OUTPUT : triggered when the selection screen is loaded in memory before being displayed.

After this selection screen is displyed

4. At selection-screen : : before leaving the selection screen.
5. At selection-screen on field
6. At selection-screen on value request - Participants to explore
7. At selection-screen on help request - Participants to explore
8. start-of-selection : the first event for displaying the report.
    - This event keyword defines an event block whose event is triggered by the ABAP runtime environment
    - when calling the executable program selection screen processing of a selection screen.
    - In an executable program, all statements that are not declarations,
    - and are listed before the first explicit processing block, are assigned to this event block.
    - If the program does not contain an explicitly defined event block START-OF-SELECTION,
    - these statements form the complete event block START-OF-SELECTION.
    - If a program contains an explicitly defined event block START-OF-SELECTION,
    - these statements are added to the beginning of the event block.
    - If the program contains no explicitly defined event blocks,
    - these statements form the entire event block START-OF-SELECTION.
9. end-of-selection - after the start-of-selection is completed.
10. top-of-page - AT beginning of page - every time a new page is started in the list.
11. end-of-page - AT end of page - every time the list data reaches the footer region of the page.

Interactive events:Events for Interactive reports
1. At line selection - every time user double-clicks(F2) on the list data.
2. At pf status - function key from F5 to F12 to perform interactive action on the list.
3. At user-command
4. Top-of-page during line selection : top of page event for secondary list.

Module pool Events
1. PBO-Process Before output
2. PAI-process After Input
3. POV-Process on value request(F1 help) 
4. POH-process on help request(F4 help)