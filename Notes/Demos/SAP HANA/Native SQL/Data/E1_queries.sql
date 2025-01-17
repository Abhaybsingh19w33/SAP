Create column Table MT_18 (
   KUNNR VARCHAR(10) primary key,
   FNAME VARCHAR(25),
   LNAME VARCHAR(25),
   EMAIL VARCHAR(25),
   FAX   VARCHAR(10),
   AEDAT DATE,
   ACTIVE varchar(1)
   
);

-- ==========================================

-- 2)write the below sql query

insert into MT_18 values('1000','SAP1000','PVTLTD','SAP1000@GMAIL.COM','02-3344556','2018/01/08','X');

insert into "TRAINEE10"."MT_18" values('1000','SAP1000','PVTLTD','SAP1000@GMAIL.COM','02-3344556','2018/01/08','X')

-- ==================================

-- 3)to insert multiple records

insert into MT_18 values('4000','SAP4000','PVTLTD','SAP4000@GMAIL.COM','02-3344556','2018/01/08','X');

insert into MT_18 values('5000','SAP5000','PVTLTD','SAP5000@GMAIL.COM','02-3344556','2018/01/08','');

OR

insert into "TRAINEE10"."MT_18" values('4000','SAP4000','PVTLTD','SAP4000@GMAIL.COM','02-3344556','2018/01/08','X');

insert into "TRAINEE10"."MT_18" values('5000','SAP5000','PVTLTD','SAP5000@GMAIL.COM','02-3344556','2018/01/08','');

-- ==========================

-- 4)Select query to fetch from the table

select 
KUNNR,
ucase(FNAME) as fnamec,
concat(fname,LNAME) as fullname,
EMAIL,
FAX,
AEDAT,
ACTIVE
 from "TRAINEE10"."MT_18"

-- =============================

-- 5) 

select 
KUNNR,
ucase(FNAME) as fnamec,
concat(fname,LNAME) as fullname,
EMAIL,
FAX ,
AEDAT,
case ACTIVE
 when 'X' then 'success'
 when '' then 'failure'
 else 'Invalid'
 end activealias
 from "TRAINEE10"."MT_18"

-- ===============
-- 6) from othe schema Error select * from kna1

Corrrect : select * from SAPLS4.kna1

-- =======
-- 7) To change the datatype of already created table use alter

alter table MT_18 alter(kunnr varchar(120))

alter table MT_18 alter( fname varchar(35))


-- ======== will not work as no authorisation======
-- You can also switch the storage type of the table from ROW to COLUMN with: 
-- ALTER TABLE <your_table_name> ALTER TYPE COLUMN
-- ========================
--  help- help contents-SAP HANA SQL and System Views Reference > SQL Reference > SQL Functions > Alphabetical List Of Functions