Difference between Work Area and Header Line 
While adding or retrieving records to / from internal table we have to keep the record temporarily. 

The area where this record is kept is called as work area for the internal table.  
The area must have the same structure as that of internal table. 
An internal table consists of a body and an optional header line. 

Header line is a implicit work area for the internal table.  
It depends on how the internal table is declared that it will have the header line or not. 

There are 2 ways/methods to create Internal table with header line.

e.g. 
Method 1. data itab type table of with header line.

Methid 2. data : begin of .. with an occurs clause creates internal table with header line

data: begin of itab occurs 10, 
           ab type c, 
           cd type i, 
        end of itab.  " this table will have the header line. 

data: wa_itab like itab. " explicit work area for itab 

data: itab1 like itab occurs 10. " table is without header line. 

The header line is a field string with the same structure as a row of the body, but it can only hold a single row. 

It is a buffer used to hold each record before it is added or each record as it is retrieved from the internal table.  It is the default work area for the internal table. 

