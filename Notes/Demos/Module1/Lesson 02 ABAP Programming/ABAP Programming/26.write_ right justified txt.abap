report z.

data: f1(6)    value 'AB'.

start-of-selection.
       write: / '-----+------1',   "write out a ruler
              / '1234567890'.
       write: / f1,
              / f1 left-justified,
              / f1 centered,
              / f1 right-justified,
              /(40) f1 left-justified,
              /(40) f1 centered,
              /(40) f1 right-justified.