Report z.
parameters: f1   default 'A',
            f2   default 'B',
            f3   default 'B'.

start-of-selection.		  
  if  f1  = f2.
    write : / f1, ' = ', f2,'f1=f2'. 
  elseif  f1 = f3.      
    write : / f1, ' = ', f3,'f1=f3'. 
  elseif   f2 = f3.
    write : / f2, ' = ', f3,'f2=f3'. 
  else. 
    write : / 'All fields are different'. 
  endif. 

*Alternatively the following does the same
  IF  F1  = F2.
    WRITE : / F1,   ' = ',  F2.
  ELSE.
    IF  F1 = F3.
      WRITE : / F1,   '= ',  F3.
    ELSE.
      IF   F2 = F3.
      WRITE : / F2,   '= ',  F3.
          ELSE.
        WRITE : /  'All fields are different'.
          ENDIF.
      ENDIF.
  ENDIF.