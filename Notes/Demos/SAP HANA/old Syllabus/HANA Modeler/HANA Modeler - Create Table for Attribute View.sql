CREATE	 COLUMN TABLE PRODUCT
(	
"PRODUCT_ID"	NVARCHAR (10) PRIMARY KEY,			
"SUPPLIER_ID"	NVARCHAR (10),				
"CATEGORY" NVARCHAR (3),				
"PRICE"	 DECIMAL (5,2)
);		

INSERT	INTO PRODUCT VALUES ('A0001','10000','A', 500.00);						
INSERT	INTO PRODUCT VALUES ('A0002','10000','B', 300.00);						
INSERT  INTO PRODUCT VALUES ('A0003','10000','C', 200.00);						
INSERT	INTO PRODUCT VALUES ('A0004','10000','D', 100.00);						
INSERT	INTO PRODUCT VALUES ('A0005','10000','A', 550.00);
				

CREATE COLUMN TABLE PRODUCT_DESC
("PRODUCT_ID" NVARCHAR (10) PRIMARY KEY,
"PRODUCT_NAME" NVARCHAR (10)				
);

INSERT INTO	PRODUCT_DESC	VALUES ('A0001','PRODUCT1');				
INSERT INTO	PRODUCT_DESC	VALUES ('A0002','PRODUCT2');					
INSERT INTO	PRODUCT_DESC	VALUES ('A0003','PRODUCT3');					
INSERT INTO	PRODUCT_DESC	VALUES ('A0004','PRODUCT4');					
INSERT INTO	PRODUCT_DESC	VALUES ('A0005','PRODUCT5');

SELECT * FROM PRODUCT;

SELECT * FROM PRODUCT_DESC;

GRANT SELECT ON SCHEMA   TO _SYS_REPO WITH GRANT OPTION;