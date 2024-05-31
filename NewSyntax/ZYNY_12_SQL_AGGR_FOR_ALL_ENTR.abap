*&---------------------------------------------------------------------*
*& Report ZYNY_12_SQL_AGGR_FOR_ALL_ENTR
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZYNY_12_SQL_AGGR_FOR_ALL_ENTR.

*Link - https://discoveringabap.com/2021/12/12/abap-7-4-and-beyond-12-abap-sql-aggregate-queries-and-for-all-entries/

*In this post you will learn a way to use aggregate functions in For 
*All Entries scenarios.

*SAP ABAP Developers have been using For All Entries for ages. 
*Aggregate queries are somehow not preferred by all, but with HANA 
*these are a must.

*Sample Aggregate Query
*Below query fetches summation of seats occupied on flights at 
*summarization level carrier_id, connection_id.

SELECT carrier_id,
       connection_id,
       SUM( seats_occupied ) AS travellers
  FROM /dmo/flight
  GROUP BY carrier_id, connection_id
  ORDER BY carrier_id, connection_id
  INTO TABLE @DATA(lt_travels_by_connection).
  
*The output of this on console will look like below.
  
*Link - https://discoveringabap.com/ezoimgfmt/discoveringabap.files.wordpress.com/2021/12/image-78.png?ezimgfmt=ng:webp/ngcb2

*Issues with Aggregate Queries
*-> FOR ALL ENTRIES can not be used with aggregates.
*-> You can not see the data that contributes to the aggregate and the 
*aggregate together

*In this post we will talk about how to handle the FOR ALL ENTRIES 
*scenario.

*Let us understand the issue first. What happens when you try to add 
*both i.e. Aggregates and Form All Entries together in the query. You 
*get a syntax error.

*Link - https://discoveringabap.com/ezoimgfmt/discoveringabap.files.wordpress.com/2021/12/image-78.png?ezimgfmt=ng:webp/ngcb2
SELECT carrier_id,
       connection_id,
       SUM( seats_occupied ) as travellers
  FROM /dom/flight
  FOR ALL ENTRIES IN @lt_carrier
  WHERE carrier_id = @lt_carrier-carrier_id
  GROUP BY carrier_id, connection_id   " <-- issue
  ORDER BY carrier_id, connection_id
  INTO TABLE @DATA(lt_travels_by_connection).
  
*Solution: Use JOIN.

*No, I am not talking about joining all tables together in select 
*query. I am talking about a join on a internal table and database table.

*Here is how –

*Link - https://discoveringabap.com/ezoimgfmt/discoveringabap.files.wordpress.com/2021/12/image-81.png?ezimgfmt=ng:webp/ngcb2

SELECT * FROM /dmo/carrier
    WHERE carrier_id IN @lr_carriers
    INTO TABLE @DATA(lt_carrier).
IF sy-subrc EQ 0.
  SELECT dtab~carrier_id,
         connection_id,
         SUM( seats_occupied ) AS travellers  " <-- aggregate
    FROM /dmo/flight AS dtab
         INNER JOIN @lt_carrier AS itab       " <-- internal table
         ON dtab~carrier_id = itab~carrier_id
    GROUP BY dtab~carrier_id, connection_id
    ORDER BY dtab~carrier_id, connection_id
    INTO TABLE @DATA(lt_travels_by_connection).
ENDIF.

*Internal table will be addressed with @itab_name as we do while using 
*it at any other position in SQL. Providing ALIAS to internal table is 
*mandatory.

*So this way we can achieve the purpose of FOR ALL ENTRIES i.e. 
*fetching data from database table based on internal table and also use 
*aggregate queries.