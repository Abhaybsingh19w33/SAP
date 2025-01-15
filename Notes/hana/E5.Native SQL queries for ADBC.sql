Queries for ADBC
Test the below native sql queries in Eclipse( Modeler perspective- SQL Console) and keep them ready for ADBC program.

1) Fetch querry

SELECT kunnr,name1 FROM SAPLS4.ZMT_KNA1

=========================================
1a)Fetch querry
New field called Custype gets created and the value  is I.


SELECT kunnr,name1,'I' as CustType 
FROM SAPLS4.ZMT_KNA1
=============================================
2) UNION query

SELECT kunnr,name1 FROM SAPLS4.ZMT_KNA1 
UNION
SELECT kunnr,name1 FROM SAPLS4.ZMT_EX_KNA1

======================================================
2a)UNION query

SELECT kunnr,name1,'Internal' as category FROM SAPLS4.ZMT_KNA1 
	UNION
SELECT kunnr,name1,'External' as category FROM SAPLS4.ZMT_EX_KNA1

============================================================
3)JOIN

SELECT o.kunnr,o.name1,o.ort01, o.land1, s.vbeln, s.netpr FROM 	SAPLS4.ZMT_KNA1 o 

inner join 
        SAPLS4.ZMT_sales s 
 on o.kunnr = s.kunnr

================================
3)Case and endcase

SELECT o.kunnr,o.name1,o.ort01, o.land1, s.vbeln, s.netpr,

case 
			when s.netpr between 1 and 100000 then 'LOW'
			when s.netpr between 100001 and 300000 then'MEDIUM'
			when s.netpr > 300001 then 'HIGH'
			
	else 'NA'
end as prty

 FROM SAPLS4.ZMT_KNA1 as o 
		inner join 
  SAPLS4.ZMT_sales as s 
  on o.kunnr = s.kunnr

====================================================
4) having clause

select kunnr, sum(netpr) from SAPLS4.ZMT_sales
 group by kunnr having sum(netpr) > 200000

====================================================