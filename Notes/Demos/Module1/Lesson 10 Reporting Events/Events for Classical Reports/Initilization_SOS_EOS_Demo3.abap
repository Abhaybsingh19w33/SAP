*A NEW EVENT ALWAYS BEGINS A NEW LINE IN THE OUTPUT.
*FOR EXAMPLE, IF YOU ISSUE A WRITE STATEMENT IN START-OF-SELECTION, 
*A WRITE IN END-OF-SELECTION WILL BEGIN ON A NEW LINE. 
*YOU CAN USE SKIP TO LINE IF IT IS NECESSARY TO CONTINUE WRITING 
*ON THE SAME LINE

REPORT Z NO STANDARD PAGE HEADING.

START-OF-SELECTION.
  WRITE  '2'.

END-OF-SELECTION.
    SKIP TO LINE 2. " TO SKIP THE NEW LINE
    WRITE 5 '3'.

INITIALIZATION.
  WRITE '1'.