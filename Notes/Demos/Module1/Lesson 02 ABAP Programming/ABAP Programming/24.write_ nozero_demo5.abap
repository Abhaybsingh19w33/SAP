report z.

data: c1(10)    type  c   value '000123' ,
         n1(10)    type  n   value 123,
         n2(10)    type  n   value 0,
         i1            type  i   value '123-',
         i2            type  i   value 123.

start-of-selection.
write:  /  c1,  20 'type c',
        / c1  no-zero,  20 'type c using no-zero',

        / n1,     20 'type n1',
        / n1  no-zero,  20 'type n1 using no-zero',

        / n2,     20 'type n2 zero value',
        / n2  no-zero,  20 'type n2 zero value using no-zero',

        / i1,     20 'type i1',
        / i2  no-sign,  20 'type i2 using no-sign'.