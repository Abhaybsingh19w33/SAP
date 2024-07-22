var_out = select kunnr , netpr as netpr
 	  from SAPLS4.zadm_sales  

____________________________________________________
Generated SQL is
1. SELECT
	 "KUNNR",
	 sum("NETPR") AS "NETPR" 
FROM "_SYS_BIC"."pkg-trainee01.Z104329/CALC_VIEW_SCRIPT3" 
GROUP BY "KUNNR"


Execute this.
View the output.
______________________________________________________________

Change Above to 
2. SELECT
*
FROM "_SYS_BIC"."pkg-trainee01.Z104329/CALC_VIEW_SCRIPT3" 

Execute this.
View the output.


Observe difference in output in 1 and 2.

Use 1 and 2 in ADBC.
Observe difference in output in 1 and 2.

__________________________________________________________________________________
var_out = select kunnr , sum(netpr) as netpr
 	  from SAPLS4.zadm_sales  
 	  group by kunnr;

 
Generated SQL is
1. SELECT
	 "KUNNR",
	 sum("NETPR") AS "NETPR" 
FROM "_SYS_BIC"."pkg-trainee01.Z104329/CALC_VIEW_SCRIPT3" 
GROUP BY "KUNNR"

Execute this.
View the output.

Change Above to 

2. SELECT
	 *
FROM "_SYS_BIC"."pkg-trainee01.Z104329/CALC_VIEW_SCRIPT3" 

Execute this.
View the output.


Observe difference in output in 1 and 2.

Use 1 and 2 in ADBC.
Observe difference in output in 1 and 2.
 	