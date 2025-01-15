CLASS ZVK_AMDP2 DEFINITION PUBLIC FINAL CREATE PUBLIC .

  PUBLIC SECTION.

   TYPES TY_EMP TYPE TABLE OF z104329EMP.
   INTERFACES : IF_AMDP_MARKER_HDB.
   METHODS
               GET_EMP
            IMPORTING
               VALUE(IN_DEPT) TYPE z104329EMP-deptno
               EXPORTING
               VALUE(OUT_EMP) TYPE TY_EMP.
  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.

CLASS ZVK_AMDP2 IMPLEMENTATION.

 METHOD GET_emp  BY DATABASE PROCEDURE
                  FOR HDB
                  LANGUAGE SQLSCRIPT
                  USING Z104329EMP.
OUT_EMP = SELECT * FROM Z104329EMP WHERE DEPTNO = IN_DEPT;

 ENDMETHOD.

ENDCLASS.


____________________________________________________


REPORT Z.
data(o_amdp) = new zvk_amdp4( ).
o_amdp->get_emp(
EXPORTING in_dept = 10
  IMPORTING
    out_emp =  data(it_emp)
).
cl_demo_output=>display( it_emp ).