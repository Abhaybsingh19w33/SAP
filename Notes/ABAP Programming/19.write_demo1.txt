report z.

data: f1(4)    type p  value 1234.
start-of-selection.
write: / '-----+------1------+---',
       / '12345678901234567'.

write /1 'X'.    "X
write  /3  'ABC'. " ABC
write  /4  f1.    "    1.234
write  /7 'Z'.   "1Z234

"========================

*write /1 'X'.    "X
*write 'YZ'.   "X YZ
*write  'MN'.   "X YZ MN
*write  2 'PQR'.   "XPQR MN