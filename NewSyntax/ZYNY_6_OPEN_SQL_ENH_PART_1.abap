*&---------------------------------------------------------------------*
*& Report ZYNY_6_OPEN_SQL_ENH_PART_1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZYNY_6_OPEN_SQL_ENH_PART_1.

* Link - https://discoveringabap.com/2021/09/23/abap-7-4-and-beyond-6-open-sql-enhancements-part-1/

*The point is that the SELECTs were not changed or upgraded for a long 
*time. And one fine day, SAP enhances the Open SQL and adds many new 
*features.

*One such change is the use of the escape character ‘@’ for the 
*host/program variables (variable/structure/table ). Earlier, we could 
*use program variables in the SQL query as if SQL is part of ABAP 
*itself. in ABAP 7.40 ‘@’ was introduced to explicitly mention that 
*anything that follows @ is a program variable. This made it possible 
*for the Open SQL parser to distinguish clearly between operands that 
*are evaluated by the database and ABAP variables whose contents have 
*to be passed to the database.

*Host Variable (@), comma-separated list, and inline declaration

*The select field list is now separated by a comma, all variables are 
*preceded by @ and a table is declared inline.

"Before 7.40
TYPES: BEGIN OF flight_type,
         carrid TYPE sbook-carrid,
         connid TYPE sbook-connid,
         fldate TYPE sbook-fldate,
       END OF flight_type.
DATA result TYPE STANDARD TABLE OF flight_type.

SELECT carrid connid fldate
  FROM sflight
  INTO TABLE result
  WHERE carrid IN s_carrid.

"From 7.40
SELECT carrid, connid, fldate
  FROM sflight
  WHERE carrid IN @s_carrid
  INTO TABLE @DATA(result).
  
*INTO clause is moved to the end of the statement as this is the new 
*home for INTO clause. Most of the queries will still work but some of 
*the queries containing arithmetic operations will ask you to move the 
*clause to the end.

*Change column names 

*It is also possible to use an alias for column names. The below query 
*will create the table flights_tab with fields carrier, connection, and 
*flight_date.

SELECT carrid AS carrier, 
       connid AS connection, 
       fldate AS flight_date
  FROM sflight
  WHERE carrid IN @s_carrid
  INTO TABLE @DATA(result).
  
*Literals as additional columns

SELECT carrid, connid, fldate, 'Extra Column' AS new_column 
  FROM sflight
  WHERE carrid IN @s_carrid
  INTO TABLE @DATA(result).
  
*Arithmetic Operations 

SELECT carrid, 
       connid, 
       fltime + 120 AS total_time,
       DIVISION( fltime, 60, 2 ) AS fltime
 FROM spfli
 WHERE carrid IN @s_carrid
 INTO TABLE @DATA(result).
  
*String Operations 

SELECT SINGLE
    CONCAT( char1, char2 ) AS concat,
    LENGTH( char1 ) AS length,
    LEFT( char1, 3 ) AS left,
    LOWER( char2 ) AS lower,
    UPPER( char2 ) AS upper, 
    RIGHT( char1, 3 ) AS right,
    SUBSTRING( char1, 3, 3 ) AS substring, 
    REPLACE( char1, ',' , '.' ) AS replace,
    CONCAT_WITH_SPACE( char1, char2, 1 ) AS concat_with_space
  FROM demo_expressions
  INTO @DATA(result).
    
*Date Functions

SELECT SINGLE dats_is_valid( dats1 ) AS valid,
              dats_days_between( dats1, dats2 ) AS days_between,
              dats_add_days( dats1, 100 ) AS add_days,
              dats_add_months( dats1, -1 ) AS add_month
       FROM demo_expressions
       INTO @DATA(result).
  
*Case Statements – Simple case

"Simple Case
SELECT num1, 
    CASE num1
      WHEN 50 THEN 'Fifty'
      WHEN 20 THEN 'Twenty' 
      ELSE 'Something Else' 
    END AS group
  FROM demo_expressions
  INTO @DATA(result).
    
*Case Statements – Complex Case

"Complex Case / Searched case
SELECT num1, num2,  
    CASE  
      WHEN num1 < 50  AND num2 < 50  THEN 'Both less than 50'  
      WHEN num1 >= 50 AND num2 >= 50 THEN 'Both more than 50'  
      ELSE 'Others'  
    END AS group  
  FROM demo_expressions  
  INTO @DATA(result).
    
*Aggregate Queries

*An essential shift with HANA is the use of aggregate queries. 
*Aggregate queries went from not recommended to recommended with HANA’s 
*code pushdown approach.

*A simple aggregate query is as below.

SELECT carrid,
       SUM( price ) AS total_price
  FROM sflight
  GROUP BY carrid
  INTO TABLE @DATA(result).
  
*Along with this, it is also possible to use the expressions we use as 
*part of the field list in the GROUP BY… HAVING clause.

SELECT num1 + num2 AS sum, COUNT( * ) AS count
  FROM demo_expressions
  GROUP BY num1 + num2
  HAVING COUNT( * ) > 10
  ORDER BY sum
  INTO TABLE @DATA(result).
  
*Client Handling

SELECT * FROM sflight
  USING CLIENT '100'
  WHERE carrid IN @s_carrid
 INTO TABLE @DATA(result).