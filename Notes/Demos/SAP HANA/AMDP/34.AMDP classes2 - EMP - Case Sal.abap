CLASS ZVK_AMDP2 DEFINITION PUBLIC FINAL CREATE PUBLIC .

PUBLIC SECTION.
  TYPES:BEGIN OF TY_EMP,
        EMPNO TYPE Z104329EMP-EMPNO,
        ENAME TYPE Z104329EMP-ENAME,
        SAL   TYPE Z104329EMP-SAL,
        SALGRADE(8)  TYPE C,
        END OF TY_EMP.
   TYPES IT_EMP TYPE TABLE OF TY_EMP.
   INTERFACES : IF_AMDP_MARKER_HDB.
   METHODS : GET_EMP EXPORTING VALUE(OUT_EMP) TYPE IT_EMP.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS ZVK_AMDP2 IMPLEMENTATION.
METHOD GET_EMP BY DATABASE PROCEDURE
                  FOR HDB
                  LANGUAGE SQLSCRIPT
                  USING Z104329EMP.
OUT_EMP = SELECT EMPNO,
                   ENAME,
                   SAL,
                  case
                   when SAL between 0 and 2000 then 'LOW'
                   when SAL between 2001 and 3000 then 'MEDIUM'
                   when SAL >  3001 then 'HIGH'
                   else 'NA'
                   end as salgrade
                   From Z104329EMP;
ENDMETHOD.


ENDCLASS.
====================SE38========================
REPORT Z.
data(o_amdp) = new zvk_amdp1( ).
o_amdp->get_emp(
  IMPORTING
    out_emp =  data(it_emp)
).
cl_demo_output=>display( it_emp ).