REPORT z.
data: f1(5)    type c  value 'ABCDE'.
write: / '-----+------1------+---',   "write out a ruler
       / '12345678901234567'.
write  /  f1(2).          "output is AB    "Read  two chhracters

write /   f1+2 .           "output is CDE   "Leave first two character and read  all
write /   f1+1 .           "output is BCDE   ""LEave first  one character and read  all

write: / f1+2(1).     "output is C   "Leave first   two character and  read one character

*+offset
*() length