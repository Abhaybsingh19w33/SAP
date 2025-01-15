REPORT Z.
DATA IT_SALES TYPE TABLE OF ZVK_CDS2_EMP.

SELECT  *
FROM ZVK_CDS2_EMP "CDS Entity Name as seen in abap pers CDS Defn
" INTO TABLE IT_SALES. "gives error. Host variables must be escaped usng @
INTO TABLE @IT_SALES.
*  INTO TABLE @data(IT_SALES).

cl_demo_output=>display( it_sales ).