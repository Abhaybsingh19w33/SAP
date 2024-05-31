*&---------------------------------------------------------------------*
*& Report ZYNY_13_SQL_WINDOW_EXPRESSION
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZYNY_13_SQL_WINDOW_EXPRESSION.

*When we write aggregate queries, we get aggregate values based on the
*fields mentioned in GROUP BY clause. Window Expression in ABAP SQL is
*similar in this sense. However, it gives you individual records as well.

*Windowing is a way to create partitions of the query result and
*perform various operations on those partitions . The Window Expression
*is the expression that helps you do this partition. Once the partition
*is done, you can apply window functions on the partitions.

*Let us consider an example. Say, you want to print price for a flight
*and also the average price for same flight connection. Below is the
*data snapshot – for Carrier AA and connection 0015, the average price
*is 2514 USD. You could get average using aggregate function AVG, but
*you wont get individual records along with it.

*Link - https://discoveringabap.com/ezoimgfmt/discoveringabap.files.wordpress.com/2021/12/image-131.png?ezimgfmt=ng:webp/ngcb2

*What is the solution for this?

*WINDOW EXPRESSION AND WINDOW FUNCTIONS.

*What is Window Expression?

*A window expression starts with a keywords OVER to define a subset of
*the result set of a query and applies a window function to it.

SELECT FROM /dmo/flight
  FIELDS
    carrier_id,
    connection_id,
    flight_date,
    price,
    AVG( price ) OVER( PARTITION BY carrier_id, connection_id )
                 AS average_price
    ORDER BY carrier_id, connection_id, flight_date
    INTO TABLE @DATA(lt_window).

*This generates below output. 2.514 E3 is 2514. The highlighted rows
*below have Carrier AA and connection 0015, so when the partition was
*applied these 2 records were put into 1 partition.

*Link - https://discoveringabap.com/ezoimgfmt/discoveringabap.files.wordpress.com/2021/12/image-134.png?ezimgfmt=ng:webp/ngcb2

*OVER keyword starts the Window Expression and PARTITION BY is similar
*to GROUP BY where partitioning fields will be mentioned.

*This query can then be enhanced further with

*-> Different partitions e.g. partition on only Carrier ID
*-> More aggregate functions like Sum, Max, Min, Count
*-> Ranking Functions like row number, rank within partition
*-> Value Functions like lead, lag within partition

*Window Functions?

*Aggregate Functions, Ranking Functions and Value Functions together
*are called as Window Function in the context of Window Expressions. In
*this post we only use aggregate functions.

*Example Query

*Below query gets count at two different levels i.e. one at carrier
*level and other for carrier and connection combination. It also gets
*average, min, max, total and what % the price is of total.

SELECT FROM /dmo/flight
  FIELDS
    carrier_id as carrier,
    connection_id as connection,
    flight_date as date,
    price,
    COUNT(*)
        OVER( PARTITION BY carrier_id )
        AS cnt_car,
    COUNT(*)
        OVER( PARTITION BY carrier_id, connection_id )
        AS cnt_conn,
    AVG( price )
        OVER( PARTITION BY carrier_id, connection_id )
        AS avg_price,
    MIN( price )
        OVER( PARTITION BY carrier_id, connection_id )
        AS min_price,
    MAX( price )
        OVER( PARTITION BY carrier_id, connection_id )
        AS max_price,
    SUM( price )
        OVER( PARTITION BY carrier_id, connection_id )
        AS total_price,
    division( 100 * price,
              SUM( price )
                OVER( PARTITION BY carrier_id, connection_id ),
              2 )
        AS percentage
    ORDER BY carrier_id, connection_id, flight_date
    INTO TABLE @DATA(lt_window).
*This query performs all these operations and gives you all the data
*that you need.

*Link - https://discoveringabap.com/ezoimgfmt/discoveringabap.files.wordpress.com/2021/12/image-135.png?ezimgfmt=ng:webp/ngcb2