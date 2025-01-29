data: begin of  itab occurs 0,
     num1 type i,
end of itab.
itab-num1 = 10.
append itab to itab. "append headerline/work area to internal table
itab-num1 = 20.
append itab to itab.
itab-num1 = 30.
append itab to itab.
itab-num1 = 40.
append itab. "implies append itab to itab
itab-num1 = 50.
append itab. "implies append itab to itab
loop at itab into itab. "loop at internal table into headerline/work area
   write / itab-num1. "displays headerline/work area
endloop.

