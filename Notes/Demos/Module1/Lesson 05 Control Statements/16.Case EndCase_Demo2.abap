Report z.
parameters f1 type i default 2.

case f1.
	when 1.  		write / 'f1 = 1'.
	when 2.     	write / 'f1 = 2'.
	when 3.     	write / 'f1 = 3'.
	when others.    write / 'f1 is not 1, 2, or 3'.
endcase.

" -----------alternate---------
if   f1 = 1.
	write / 'f1 = 1'.
elseif  f1 = 2.
	write / 'f1 = 2'.
elseif  f1 = 3.
	write / 'f1 = 3'.
else.
	write / 'f1 is not 1, 2, or 3'.
endif.