REPORT  ZVK1.
START-OF-SELECTION.
WRITE : / text-000,
        /'SY-LSIND=' , SY-LSIND.

AT LINE-SELECTION.
CASE sy-lsind.
     when 1.
         write : / text-001,
        /'SY-LSIND=' , SY-LSIND.
     when 2.
         write : / text-002,
        /'SY-LSIND=' , SY-LSIND.
ENDCASE.