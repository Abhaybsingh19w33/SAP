REPORT  Z.

*internal table made to populate the value of DEPTNO when pressing f4

DATA: BEGIN OF it_final OCCURS 0,
        deptno TYPE z104329dept-deptno,
      END OF it_final.

DATA: it_return LIKE ddshretval OCCURS 0 WITH HEADER LINE.

PARAMETERS: p_deptno(10) TYPE c.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_deptno.
  SELECT  deptno FROM z104329dept INTO TABLE it_final.

  CALL FUNCTION 'F4IF_INT_TABLE_VALUE_REQUEST'
    EXPORTING
      retfield   = 'DEPTNO'   "field of internal table
      value_org  = 'S'
    TABLES
      value_tab  = it_final "internal table
      return_tab = it_return. "

  p_deptno = it_return-fieldval.
  "REFRESH it_final.

START-OF-SELECTION.
  WRITE p_deptno.
  
  CL_DEMO_OUTPUT=>DISPLAY( IT_FINAL ).
  CL_DEMO_OUTPUT=>DISPLAY( IT_RETURN ).