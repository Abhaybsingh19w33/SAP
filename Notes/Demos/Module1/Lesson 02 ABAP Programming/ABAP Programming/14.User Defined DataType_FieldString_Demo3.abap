* structure type fs
*cannot assign value
report z.
types: begin of udfnames,
        firstname(30),
        lastname(30),
       end of udfnames.

data: begin of empinfo,
        code        type  i,
        name        type udfnames,
        salary      type  p,
        date        type d,
      end of empinfo.

empinfo-code             = 2720.
empinfo-name-firstname   =  'Vandana'.
empinfo-name-lastname    =  'Koleshwar'.

write: /  empinfo-code,
          empinfo-name-firstname, 
          empinfo-name-lastname.