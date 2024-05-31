*&---------------------------------------------------------------------*
*& Report ZYNY_3_LOOP_AT_GROUPS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zyny_3_loop_at_groups.

*Link - https://discoveringabap.com/2021/09/22/abap-7-4-and-beyond-3-loop-at-groups/

*In this post, you will learn about LOOP AT… GROUP BY statement
*introduced in 7.40. This statement can be used instead of using AT
*NEW… END AT statements.

*You can refer SCN wiki Control Level Statements in ABAP – ABAP
*Development – Community Wiki (sap.com)
*(https://wiki.scn.sap.com/wiki/display/ABAP/Control+Level+Statements+in+ABAP) to learn about the AT… END AT
*control level statements.

*In short, there are 4 AT statements which can be used inside a LOOP to
*produce summarization data.

*1. AT FIRST
*-> Executed on the first record of the table
*-> Can be used to write headers for report

*2. AT NEW <field>
*-> Executed when the combination of fields up to the field mentioned after AT NEW changes
*-> Can be used to initialize summarization data for the selected combination

*3. AT END OF <field>
*-> Executed on the last entry of the combination of fields up to the
*field mentioned after AT END OF
*-> Can be used to write the summarized data to internal table or screen /
*to call a BAPI

*4. AT LAST
*-> Executed on the last record of the table
*-> Clear / Free data tables

*The control goes into the AT… ENDAT blocks as per below table.

*link - https://discoveringabap.com/ezoimgfmt/discoveringabap.files.wordpress.com/2021/09/abap7.4_2_1.jpg?ezimgfmt=ng:webp/ngcb2

*For example, to print sum of total luggage weight per CARRID, CONNID,
*FLDATE combination using AT statements would look like below.

LOOP AT bookings INTO DATA(booking).
  AT FIRST.
    WRITE: 'Carrier', 9 'Connection', 21 'Flight Date'.
    ULINE.
  ENDAT.
  AT NEW fldate.
    CLEAR total_weight.
    WRITE: /  booking-carrid, 9 booking-connid,
           21 booking-fldate.
    WRITE: 35 'Customer Id', 50 'Luggage Weight'.
  ENDAT.

  WRITE: /35 booking-customid, 50 booking-luggweight.
  total_weight = total_weight + booking-luggweight.

  AT END OF fldate.
    WRITE: /35 'Total Weight : ', 50 total_weight.
    ULINE.
  ENDAT.
ENDLOOP.

*the output is as below.
*Link - https://discoveringabap.com/ezoimgfmt/discoveringabap.files.wordpress.com/2021/09/abap7.4_2_2.jpg?ezimgfmt=ng:webp/ngcb2

*the same output can be achieved in abap 7.4 using the LOOP AT .. GROUP BY.

WRITE: 'Carrier', 9 'Connection', 21 'Flight Date'.
ULINE.
LOOP AT bookings INTO DATA(booking_gr)
                 GROUP BY ( carrid = booking_gr-carrid
                            connid = booking_gr-connid
                            fldate = booking_gr-fldate ).
  WRITE: /  booking_gr-carrid, 9 booking_gr-connid,
         21 booking_gr-fldate.
  WRITE: 35 'Customer Id', 50 'Luggage Weight'.

  CLEAR total_weight.
  LOOP AT GROUP booking_gr
                ASSIGNING FIELD-SYMBOL(<booking>).
    WRITE: /35 <booking>-customid, 50 <booking>-luggweight.
    total_weight = total_weight + <booking>-luggweight.
  ENDLOOP.

  WRITE: /35 'Total Weight : ', 50 total_weight.
  ULINE.
ENDLOOP.

*For simplicity – let us look at the code without the write statements.

LOOP AT bookings INTO DATA(booking_gr)
                 GROUP BY ( carrid = booking_gr-carrid
                            connid = booking_gr-connid
                            fldate = booking_gr-fldate ).
  CLEAR total_weight.
  LOOP AT GROUP booking_gr ASSIGNING FIELD-SYMBOL(<booking>).
    total_weight = total_weight + <booking>-luggweight.
  ENDLOOP.
ENDLOOP.

*this creates a deep structure booking_gr which has fields from the
*group by clause (carrid, connid, fldate) and the table entries which
*match this combination. to loop on this you need to use loop at group.

*variations –

*1. without members – get unique values without requirement to loop on
*group members.

LOOP AT bookings INTO DATA(booking_gr)
                 GROUP BY ( carrid = booking_gr-carrid )
                 WITHOUT MEMBERS
                 REFERENCE INTO DATA(booking_gr_2).
  WRITE: / booking_gr_2->carrid.
ENDLOOP.
*note that a explicit reference is used to get the data. the output is
*as below.

*Link - https://discoveringabap.com/ezoimgfmt/discoveringabap.files.wordpress.com/2021/09/abap7.4_2_3.jpg?ezimgfmt=ng:webp/ngcb2

*2. usage of MEMBERS, SIZE and INDEX

*here, you can get the index for the group and size of the group i.e.
*number of members in the group. notice the sorting order specified.
*Default is ASCENDING.

LOOP AT bookings INTO DATA(booking_gr)
                 GROUP BY ( carrid = booking_gr-carrid
                            size   = GROUP SIZE
                            index  = GROUP INDEX )
                ASCENDING
                REFERENCE INTO DATA(booking_gr_2).
  WRITE: / booking_gr_2->index LEFT-JUSTIFIED,
          booking_gr_2->carrid,
          booking_gr_2->size.
ENDLOOP.


*Output - https://discoveringabap.com/ezoimgfmt/discoveringabap.files.wordpress.com/2021/09/abap7.4_2_4.jpg?ezimgfmt=ng:webp/ngcb2


*so, by using loop at… group by you can get rid of the at statements,
*make the code cleaner. and unlike at – you don’t need the fields used
*in combinations to be the first in the table structure.

*for example, below will also work.

LOOP AT bookings INTO DATA(booking_gr)
                 GROUP BY ( customid = booking_gr-customid
                            size     = GROUP SIZE
                            index    = GROUP INDEX )
                 REFERENCE INTO DATA(booking_gr_2).
  WRITE: / booking_gr_2->customid, booking_gr_2->size.
ENDLOOP.