report z.
data f1(4)    value 'ABCD'.

start-of-selection.
write:  / f1, f1,        "output is ABCD ABCD
        / f1 no-gap, f1,    "output is ABCDABCD
        / '''', f1, ''''.     "output is '  ABCD  '