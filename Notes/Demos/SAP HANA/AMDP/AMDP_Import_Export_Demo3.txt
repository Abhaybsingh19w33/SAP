CLASS ZVK_AMDP2 DEFINITION PUBLIC FINAL CREATE PUBLIC .

  PUBLIC SECTION.

   TYPES TY_EMP TYPE TABLE OF z104329EMP.
   TYPES TY_DEPT TYPE TABLE OF z104329DEPT.
   INTERFACES : IF_AMDP_MARKER_HDB.
   METHODS
               GET_EMP
            IMPORTING
               VALUE(IN_DEPT) TYPE z104329EMP-deptno
               EXPORTING
               VALUE(OUT_EMP) TYPE TY_EMP.
   METHODS
               GET_DEPT
            IMPORTING
               VALUE(IN_DEPT) TYPE z104329EMP-deptno
               EXPORTING
               VALUE(OUT_DEPT) TYPE TY_DEPT.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.

CLASS ZVK_AMDP2 IMPLEMENTATION.

 METHOD GET_EMP  BY DATABASE PROCEDURE
                  FOR HDB
                  LANGUAGE SQLSCRIPT
                  USING Z104329EMP.
OUT_EMP  = SELECT * FROM Z104329EMP  WHERE DEPTNO = IN_DEPT;
 ENDMETHOD.

 METHOD GET_DEPT BY DATABASE PROCEDURE
                  FOR HDB
                  LANGUAGE SQLSCRIPT
                  USING z104329dept.
OUT_DEPT = SELECT * FROM Z104329DEPT WHERE DEPTNO = IN_DEPT;
 ENDMETHOD.

ENDCLASS.
____________________________________________
REPORT Z.
data(o_amdp) = new zvk_amdp4( ).
o_amdp->get_emp(
EXPORTING in_dept = 10
  IMPORTING
    out_emp =  data(it_emp)
).

o_amdp->get_dept(
EXPORTING in_dept = 10
  IMPORTING
    out_dept =  data(it_dept)
).
cl_demo_output=>display( it_emp ).
cl_demo_output=>display( it_dept ).



