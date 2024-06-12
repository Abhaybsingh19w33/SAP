*&---------------------------------------------------------------------*
*& Report ZYNY_15_SQL_WIN_EXP_RANK_VALUE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZYNY_15_SQL_WIN_EXP_RANK_VALUE.

*In this post, you will learn about Rank and Value Functions that can 
*be used in Window Expression.

*Aggregate Functions
*-> AVG / MEDIAN
*-> MAX / MIN
*-> SUM
*-> STDDEV / VAR / CORR
*-> COUNT

*Ranking Function
*-> ROW_NUMBER
*-> RANK
*-> DENSE_RANK
*-> NTILE

*Value Functions
*-> FIRST_VALUE
*-> LAST_VALUE
*-> LEAD
*-> LAG

*For the demonstration of these functions we will consider below table 
*entries from table /DMO/FLIGHT (new version of table SFLIGHT) with 
*Windows at Carrier Id.

*Link - https://discoveringabap.com/wp-content/uploads/2021/12/image-163.png?ezimgfmt=ng:webp/ngcb2

*ROW_NUMBER

*ROW_NUMBER does not have any argument. It will simply assign an 
*integer row number as per the ORDER BY clause.

"ROW_NUMBER
SELECT FROM /dmo/flight
    FIELDS
        carrier_id,
        connection_id,
        seats_occupied,
        ROW_NUMBER( ) OVER( PARTITION BY carrier_id
                            ORDER BY seats_occupied ) AS so_row,
        DENSE_RANK( ) OVER( PARTITION BY carrier_id
                            ORDER BY flight_date ) AS fldate_row
        INTO TABLE @DATA(lt_window).
  
*Note that you can use this function multiple times to get row number 
*with different sort order but the result set will be sorted by per the 
*sort order used for last partition.

*Link - https://discoveringabap.com/wp-content/uploads/2021/12/image-170.png?ezimgfmt=ng:webp/ngcb2

*RANK / DENSE_RANK

*Rank simply assigns the rank based on ORDER BY clause. Dense Rank 
*function is same as Rank except it does not skip any rank if multiple 
*entries exists with same ORDER BY field values.
"RANK / DENSE_RANK
SELECT FROM /dmo/flight
    FIELDS
        carrier_id,
        connection_id,
        seats_occupied,
        RANK( ) OVER( PARTITION BY carrier_id
                            ORDER BY connection_id ) AS rank,
        DENSE_RANK( ) OVER( PARTITION BY carrier_id
                            ORDER BY connection_id ) AS dense_rank
        INTO TABLE @DATA(lt_window).
  
*Link - https://discoveringabap.com/wp-content/uploads/2021/12/image-171.png?ezimgfmt=ng:webp/ngcb2

*Rank skips number 2 as first two entries are at the same rank 1. Dense 
*Rank does continuous ranking without skipping any rank.

*NTILE( n )

*NTILE will split the Window in 'n' number of frames. Here, n can be a 
*variable but the variable should not have a -ve value. If it has a -ve 
*value then a runtime error CX_SY_OPEN_SQL_DB will occur.

*Imagine if you want to split the sales totals per quarter where you 
*need to split the data for a year in 4 groups of 3 months – NTILE can 
*be used to assign the quarters.

"NTILE(N)
SELECT FROM /dmo/flight
    FIELDS
        carrier_id,
        connection_id,
        seats_occupied,
        NTILE( 3 ) OVER( PARTITION BY carrier_id
                            ORDER BY connection_id ) AS group_number
        INTO TABLE @DATA(lt_window).
  
*Link - https://discoveringabap.com/wp-content/uploads/2021/12/image-175.png?ezimgfmt=ng:webp/ngcb2

*FIRST VALUE / LAST VALUE

*As the name suggests, these functions provide the first and the last 
*value of the Window as per the Sort sequence. The query is as below –

"FIRST VALUE / LAST VALUE
SELECT FROM /dmo/flight
    FIELDS
        carrier_id,
        connection_id,
        seats_occupied,
        FIRST_VALUE( seats_occupied ) OVER( PARTITION BY carrier_id
                                         ORDER BY connection_id ) AS seats_first,
        LAST_VALUE( seats_occupied ) OVER( PARTITION BY carrier_id
                                         ORDER BY connection_id ) AS seats_last,
        LAST_VALUE( seats_occupied ) OVER( PARTITION BY carrier_id
                                         ORDER BY connection_id
                                         ROWS BETWEEN UNBOUNDED PRECEDING
                                         AND UNBOUNDED FOLLOWING
                                         ) AS true_seats_last
        INTO TABLE @DATA(lt_window).
  
*For the last value providing the frame is important. Otherwise it will 
*simply provide the value from current row only.

*As seen below, the widows are partitioned at Carrier ID creating 2 
*windows for SQ and UA (only these 2 are used for explanation).

*SEATS_LAST i.e. the LAST_VALUE function will provide the value from 
*the last row where the Order By fields have the same value. If we need 
*last value from the Window i.e. at PARTITION BY fields level, then we 
*have to specify addition ROWS BETWEEN.

*Link - https://discoveringabap.com/wp-content/uploads/2021/12/image-164.png?ezimgfmt=ng:webp/ngcb2

*LEAD / LAG

*These can only be specified only with ORDER BY clause.

*Lead gives value from next record and Lag gives value from the 
*previous record in its simplest form.

"LEAD / LAG
SELECT FROM /dmo/flight
    FIELDS
        carrier_id,
        connection_id,
        seats_occupied,
        LEAD( seats_occupied ) OVER( PARTITION BY carrier_id
                                         ORDER BY connection_id ) AS lead_seats,
        LAG( seats_occupied ) OVER( PARTITION BY carrier_id
                                         ORDER BY connection_id ) AS lag_seats
        INTO TABLE @DATA(lt_window).

These functions can be used to get the variance between current row, 
earlier row and next row.