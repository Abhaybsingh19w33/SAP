*&---------------------------------------------------------------------*
*& Report ZYNY_14_SQL_WINDOW_EXP_WITH_FR
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zyny_14_sql_window_exp_with_fr.

*In this post, you will learn to use ORDER BY to create Windows and
*Frames within the windows.

*Windows can be created in two ways

*-> PARTITION BY which we have seen in previous post
*-> ORDER BY – This creates a frame within the current window so that
*Ranking Function can be applied on it.

*Let us see an example,

*Simple Window Expression – PARTITION BY

*We will get average seats occupied for a carrier.

SELECT FROM /dmo/flight
  FIELDS carrier_id,
    seats_occupied,
    AVG( seats_occupied ) over( partition BY carrier_id )
                 AS avg_seats_occupied
    INTO TABLE @DATA(lt_window).

*Note that Window Expression will provide individual records also along
*with aggregates.

*Link - https://discoveringabap.com/wp-content/uploads/2021/12/image-145.png?ezimgfmt=ng:webp/ngcb2

*Simple Window Expression – ORDER BY

*Using Order By we can create windows using SORT sequence rather than
*field values. For example, if we sort by Average Seats Occupied we can
*get the average number of seats occupied from the first row to the
*current row.

SELECT FROM /dmo/flight
  FIELDS carrier_id,
    seats_occupied,
    AVG( seats_occupied ) over( ORDER BY seats_occupied
                                rows between unbounded preceding and current row )
                 AS avg_seats_occupied
    INTO TABLE @DATA(lt_window).

*Link - https://discoveringabap.com/wp-content/uploads/2021/12/image-148.png?ezimgfmt=ng:webp/ngcb2

*Simple Window Expression – Frames Using ORDER BY
*The ROWS BETWEEN the addition create the FRAMES.

************************************************************************
*ROWS BETWEEN A AND B
************************************************************************
*What can we specify in A?
*UNBOUNDED PRECEDING
*Frame starts at the first row of the window

*CURRENT ROW
*Frame starts at current row

*(n) PRECEDING
*Frame starts n rows above the current row

*(n) FOLLOWING
*Frame starts n rows beneath the current row
************************************************************************
*What can we specify in B?
*UNBOUNDED FOLLOWING
*Frame ends at the last row of the partition

*CURRENT ROW
*Frame ends at current row

*(n) PRECEDING
*Frame ends n rows above the current row

*(n) FOLLOWING
*Frame ends n rows beneath the current row
************************************************************************

*We can use combinations including but not limited to the below examples.

*-> ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
*-> ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
*-> ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
*-> ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING

*Combining PARTITION and ORDER BY
*Example: Get seats occupied average for the last 3 flights for a
*carrier id. i.e. 2 previous flights and the current row should be
*considered.

SELECT FROM /dmo/flight
  FIELDS carrier_id,
    flight_date,
    seats_occupied,
    AVG( seats_occupied ) over( partition BY carrier_id
                                ORDER BY flight_date
                                rows between 2 preceding and current row )
                 AS avg_seats_occupied
    INTO TABLE @DATA(lt_window).

*Link - https://discoveringabap.com/wp-content/uploads/2021/12/image-151.png?ezimgfmt=ng:webp/ngcb2

*Let us complicate this a little

*It’s not really making it complex but using more functionality to show
*a glimpse of the potential of these queries.

*With the below single query, we can produce data to analyze the trend
*of no. of travelers for any carrier.

SELECT FROM /dmo/flight
  FIELDS carrier_id AS carrier,
         flight_date AS date,
         seats_occupied AS traveller,
         COUNT( * ) over ( partition BY carrier_id
                           ORDER BY flight_date
                           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING )
         AS flights,
         sum( seats_occupied ) over ( partition BY carrier_id
                                      ORDER BY flight_date
                                      ROWS BETWEEN unbounded preceding AND CURRENT row )
         AS cumulative_traveller,
         sum( seats_occupied ) over ( partition BY carrier_id
                                      ORDER BY flight_date
                                      ROWS BETWEEN unbounded preceding AND unbounded following )
         AS total_traveller,
         AVG( seats_occupied ) over ( partition BY carrier_id
                                      ORDER BY flight_date
                                      ROWS BETWEEN 2 preceding AND CURRENT row )
         AS avg_travellers_recent,
         AVG( seats_occupied ) over ( partition BY carrier_id
                                      ORDER BY flight_date
                                      ROWS BETWEEN unbounded preceding AND unbounded following )
         AS avg_travellers_all
         INTO TABLE @DATA(lt_window).

*Link - https://discoveringabap.com/wp-content/uploads/2021/12/image-155.png?ezimgfmt=ng:webp/ngcb2

*By looking at the data, we can see that all 3 carriers i.e. SQ, AA,
*and SQ peaked at a certain point and then on a downward trend.