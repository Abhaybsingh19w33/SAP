CLASS ZVK_AMDP2 DEFINITION PUBLIC FINAL CREATE PUBLIC .

  PUBLIC SECTION.

   TYPES TY_EMP TYPE TABLE OF z104329EMP.
   TYPES TY_DEPT TYPE TABLE OF z104329DEPT.
   INTERFACES : IF_AMDP_MARKER_HDB.
   METHODS
               GET_EMPDEPT
            IMPORTING
               VALUE(IN_DEPT) TYPE z104329EMP-deptno
               EXPORTING
               VALUE(OUT_EMP) TYPE TY_EMP
               VALUE(OUT_DEPT) TYPE TY_DEPT.
  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.

CLASS ZVK_AMDP2 IMPLEMENTATION.

 METHOD GET_EMPDEPT  BY DATABASE PROCEDURE
                  FOR HDB
                  LANGUAGE SQLSCRIPT
                  USING Z104329EMP z104329dept.
OUT_EMP  = SELECT * FROM Z104329EMP  WHERE DEPTNO = IN_DEPT;
OUT_DEPT = SELECT * FROM Z104329DEPT WHERE DEPTNO = IN_DEPT;
ENDMETHOD.

ENDCLASS.

_______________________________________________________________________

REPORT Z.
data(o_amdp) = new zvk_amdp4( ).
o_amdp->get_empdept(
EXPORTING in_dept = 10
  IMPORTING
    out_emp =  data(it_emp)
    out_dept = data(it_dept)
).
cl_demo_output=>display( it_emp ).
cl_demo_output=>display( it_dept ).