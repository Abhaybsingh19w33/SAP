REPORT Z.
"Reading record from internal table
SELECT
  CARRID,
  CONNID,
  CITYFROM,
  CITYTO
  FROM SPFLI
  INTO TABLE @DATA(ITAB).

*Classic  - 10th rec from it_sales
"READ TABLE ITAB INTO DATA(WA) INDEX 10.
"WRITE : / WA-CARRID, WA-CONNID.
"CLEAR WA.

*optimised abap
DATA(WA) = ITAB[ 10 ].
WRITE : / WA-CARRID, WA-CONNID.