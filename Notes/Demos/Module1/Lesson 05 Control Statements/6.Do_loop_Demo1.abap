Report z.
*sy-index = 99. 
write:  / 'Before loop, sy-index = ', sy-index, / ' '.
do 5 times.
	write sy-index. 
enddo.

write:  / 'After loop, sy-index = ', sy-index, / ' '.