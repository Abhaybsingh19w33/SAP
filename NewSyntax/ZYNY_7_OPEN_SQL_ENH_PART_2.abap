*&---------------------------------------------------------------------*
*& Report ZYNY_7_OPEN_SQL_ENH_PART_2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zyny_7_open_sql_enh_part_2.

*Link - https://discoveringabap.com/2021/09/23/abap-7-4-and-beyond-7-open-sql-enhancements-part-2/#google_vignette

*Select with Joins

*JOINs have always been there and we have been avoiding them and
*preferred the 'FOR ALL ENTRIES'. Not anymore, we can now use joins
*effectively with SAP HANA. We now have RIGHT OUTER JOIN as well.

*Inner Join

*Join the table with the ON condition. Inner join means, the data is
*selected only if data is found in both tables.

DATA(lv_city_from) = 'BERLIN'.

SELECT c~carrname, p~connid
  FROM scarr AS c INNER JOIN spfli AS p
    ON p~carrid   = c~carrid AND
       p~cityfrom = @lv_city_from
  INTO TABLE @DATA(lt_flights).

*Left Outer Join

*Here, scarr is the left-table and SPFLI is the right-table. The data
*is selected from the left-table and if a matching record is found in
*the right-table, fields from the right-table are populated, else they
*have an initial value.

DATA(lv_city_from) = 'BERLIN'.

SELECT c~carrname, p~connid
 FROM scarr AS c LEFT OUTER JOIN spfli AS p
 ON p~carrid   = c~carrid AND
    p~cityfrom = @lv_city_from
 INTO TABLE @DATA(lt_flights).

*Coalesce

*For outer joins, if you need to add a specific value for the field
*where the entry in the outer table does not exist – Coalesce can be
*used.

DATA(lv_city_from) = 'BERLIN'.

SELECT c~carrname, coalesce( p~connid, '9999' ) AS connid
 FROM scarr AS c LEFT OUTER JOIN spfli AS p
 ON p~carrid   = c~carrid AND
    p~cityfrom = @lv_city_from
 INTO TABLE @DATA(lt_flights).

*Right Outer Join

*Here as well, scarr is the left-table and SPFLI is the right-table.
*The data is selected from the right table and if a matching record is
*found in the left-table, fields from the left-table are populated,
*else they have an initial value.

DATA(lv_city_from) = 'BERLIN'.

SELECT c~carrname, p~connid
  FROM scarr AS c RIGHT OUTER JOIN spfli AS p
    ON p~carrid = c~carrid AND
       p~cityfrom = @lv_city_from
  INTO TABLE @DATA(lt_flights).

*Select all fields from a table in Join

*Now, you can specify fields to be selected using the keyword FIELD and
*also use <tablename>-* to indicate that all fields from that table
*should be selected.

SELECT
  FROM sflight INNER JOIN spfli
  ON sflight~carrid = spfli~carrid AND
     sflight~connid = spfli~connid
  FIELDS spfli~*, sflight~fldate
  INTO TABLE @DATA(result).

*UNION in SELECT
*The addition of UNION creates the union of the results sets of two
*SELECT statements. The rows of the results set of the SELECT statement
*on the right of UNION are inserted into the results set of the SELECT
*statement on the left of UNION. The columns of the results set keep
*the names defined in the SELECT statement on the left of UNION.

*OPEN SQL offers Union from 7.50.

"Before 7.50
SELECT schedule~carrid, schedule~connid, schedule~fldate,
       flight~cityfrom, flight~cityto
  FROM sflight AS schedule INNER JOIN spfli AS flight
    ON schedule~carrid = flight~carrid AND
       schedule~connid = flight~connid
  WHERE flight~cityfrom = 'FRANKFURT'
  INTO TABLE @DATA(lt_flights).

SELECT schedule~carrid, schedule~connid, schedule~fldate,
       flight~cityfrom, flight~cityto
 FROM sflight AS schedule INNER JOIN spfli AS flight
   ON schedule~carrid = flight~carrid AND
      schedule~connid = flight~connid
  WHERE flight~cityfrom = 'SAN FRANCISCO'
  APPENDING TABLE @lt_flights.

"From 7.50
SELECT schedule~carrid, schedule~connid, schedule~fldate,
       flight~cityfrom, flight~cityto
  FROM sflight AS schedule INNER JOIN spfli AS flight
    ON schedule~carrid = flight~carrid AND
       schedule~connid = flight~connid
    WHERE flight~cityfrom = 'FRANKFURT'

UNION ALL

SELECT schedule~carrid, schedule~connid, schedule~fldate,
       flight~cityfrom, flight~cityto
 FROM sflight AS schedule INNER JOIN spfli AS flight
   ON schedule~carrid = flight~carrid AND
      schedule~connid = flight~connid
 WHERE flight~cityfrom = 'SAN FRANCISCO'

INTO TABLE @DATA(lt_flights).

*Notice that the INTO clause moves to the end. So it would be a good
*habit if we move the clause to the end for all the queries. Also, if
*we want only the unique records, we can use UNION DISTINCT instead of
*UNION ALL. ( If nothing is specified after UNION, the default mode
*used is DISTINCT ).

*Important:

*->The Union can also work on selecting data from different tables as
*long as the same fields are selected.
*->UNION queries can not use FOR ALL ENTRIES
*-> AGGREGATEs can be used in UNION queries

*SELECT FROM INTERNAL_TABLE

"Select from Database Tables
SELECT schedule~carrid AS carrier_id,
       schedule~connid AS connection_id,
       schedule~fldate AS flight_date,
       flight~cityfrom AS city_from,
       flight~cityto   AS city_to
  FROM sflight AS schedule INNER JOIN spfli AS flight
    ON schedule~carrid = flight~carrid AND
       schedule~connid = flight~connid
  INTO TABLE @DATA(lt_flights).

"Select from Internal Table
SELECT carrier_id,
       connection_id,
       flight_date
  FROM @lt_flights AS flights
  WHERE city_from = 'FRANKFURT'
  INTO TABLE @DATA(lt_new_flights).

*As we are selecting from the internal table we need to use the escape
*character @ for the host variable and mention the alias using AS.

*FIELD Keyword
*The field list in the query can be also specified with the keyword
*FIELD. This allows you to specify fields after the FROM clause which
*is similar to how we write CDS.

SELECT SINGLE
  FROM @lt_flights AS flights
  FIELDS carrier_id, connection_id
  WHERE flight_date = @sy-datum AND
        city_from = 'FRANKFURT'
  INTO @DATA(todays_flight).

*Temporary table using the clause WITH (7.51+)
*Using the keyword 'WITH', a dataset is created which can be further
*used in the query. We can have multiple such named datasets and they
*all need to start with +.

WITH
  +cities AS ( SELECT cityfrom AS city FROM spfli WHERE carrid = 'LH'
               UNION DISTINCT
               SELECT cityto   AS city FROM spfli WHERE carrid = 'LH' )
  SELECT * FROM sgeocity
    WHERE city IN ( SELECT city FROM +cities )
    INTO TABLE @DATA(result).