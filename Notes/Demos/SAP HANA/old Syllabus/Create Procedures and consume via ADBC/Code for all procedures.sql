CREATE PROCEDURE vk2 ( in pkunnr varchar(10) , out res SAPLS4.ZADM_SALES) 
	LANGUAGE SQLSCRIPT
	SQL SECURITY INVOKER 
	--DEFAULT SCHEMA <default_schema_name>
	READS SQL DATA AS
BEGIN
/***************************** 
	Write your procedure logic 
 *****************************/
 res = select * from zadm_sales where kunnr = pkunnr;
 
END;

Modeler Perspective - SQL
call "_SYS_BIC"."pkg-trainee01.Z104329/vk2"(7000,NULL);

-- ____________________________________________________

CREATE TYPE TT_SALES AS TABLE ( KUNNR NVARCHAR(10), NETPR DECIMAL(13,2) ); 

CREATE PROCEDURE vk3 (  OUT RES_TAB  TT_SALES ) 
	LANGUAGE SQLSCRIPT
	SQL SECURITY INVOKER 
	--DEFAULT SCHEMA <default_schema_name>
	READS SQL DATA AS 
BEGIN
/***************************** 
	Write your procedure logic 
 *****************************/
 res_tab = select KUNNR, SUM(NETPR) AS NETPR  from sapls4.zadm_sales GROUP BY KUNNR;

END;


call "_SYS_BIC"."pkg-trainee01.Z104329/vk3"(null)

-- __________________________________________________________________


/*
You can create new table types and use them as input and output parameters in a procedure.
To do this, define the table types using SQL syntax, for example:
CREATE TYPE <Type Name> AS TABLE (<Field Name1> <Field Type1>, <Field Name2> <Field Type2>,...);
*/

CREATE TYPE TT1_SALES AS TABLE ( KUNNR NVARCHAR(10), NETPR DECIMAL(13,2) ); 

CREATE TYPE TT2_SALES AS TABLE ( KUNNR NVARCHAR(10), VBELN CHAR(11) ); 


CREATE PROCEDURE vk4 ( OUT RES_TAB  TT1_SALES , OUT RES_TAB1  TT2_SALES ) 
	LANGUAGE SQLSCRIPT
	SQL SECURITY INVOKER 
	--DEFAULT SCHEMA <default_schema_name>
	READS SQL DATA AS
BEGIN
/***************************** 
	Write your procedure logic 
 *****************************/
 RES_TAB =  select KUNNR, SUM(NETPR) AS NETPR  from sapls4.zadm_sales GROUP BY KUNNR;
 
RES_TAB1 = SELECT KUNNR, VBELN from sapls4.zadm_sales;
 
END;

-- _____________________________
-- Modeler Perspective

CALL "_SYS_BIC"."pkg-trainee01.Z104329/vk4"(NULL, NULL)