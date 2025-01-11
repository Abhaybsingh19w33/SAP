report z.
do 10 times.
	if sy-index between 3 and 8.
		continue.
	endif.
	write sy-index.
enddo.
