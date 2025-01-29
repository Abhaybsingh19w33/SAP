*is true if <f1> also contains characters 
*other than those in <f2>. 
*The comparison is case-sensitive. 
*Trailing blanks are included. 
*If the comparison is true, 
*the system field SY-FDPOS contains the 
*offset of the first character of <f1> 
*that does not occur in <f2>. 
*If it is false, SY-FDPOS contains the length of <f1>.
REPORT z.

PERFORM co1.
PERFORM co2.
*PERFORM cn1.
*PERFORM cn2.
*PERFORM ca1.
*PERFORM ca2.
*PERFORM na1.
*PERFORM na2.
*PERFORM CP1.
PERFORM CP2.

FORM co1.
* 	operator: CO
*	True, if operand1 only contains characters from operand2
	write / '''AABB''  co ''AB'''.         	"output is �AABB�  co �AB�
	if 'AABB' co 'AB'.		         	"True	
		write 'True'.
	else.
		write 'False'.
	endif.
	write: /  'sy-fdpos = ', sy-fdpos.
	write / '''ABCD''  co ''ABC'''.       "output is �ABCD�  co �ABC�
ENDFORM.  

FORM co2.
	if 'ABCD' co 'ABC'.		           " False	
		write 'True'.
	else.
		write 'False'.
	endif.
	write: / 'sy-fdpos = ', sy-fdpos.
ENDFORM.  

FORM cn1.
* 	operator: CN
*	True if a logical expression with CO is false, that is, if operand1 contains not only *characters from operand2
	write / '''AABB''  cn ''AB'''.         	"output is �AABB�  cn �AB�
	if 'AABB' cn 'AB'.		         	" False	
		write 'True'.
	else.
		write 'False'.
	endif.
	write: / 'sy-fdpos = ', sy-fdpos.
ENDFORM.

FORM cn2.
	write / '''ABCD''  cn ''ABC'''.        "output is �ABCD�  cn �ABC�
	if 'ABCD' cn 'ABC'.		            " True	
		write 'True'.
	else.
		write 'False'.
	endif.
	write: / 'sy-fdpos = ', sy-fdpos.
ENDFORM. 

FORM ca1.
* operator: CA
* True, if operand1 contains at least one character from operand2
	write / '''AXCZ''  ca ''�AB'''.   "output is �AXCZ�  ca �AB�
	if 'AXCZ' ca 'AB'.		           "True	
		write 'True'.
	else.
		write 'False'.
	endif.
	write:/  'sy-fdpos = ', sy-fdpos.
ENDFORM.

FORM ca2.
	write / '''ABCD''  ca ''XYZ'''.     "output is �ABCD�  ca �XYZ�
	if 'ABCD' ca 'XYZ'.		          	" False	
		write 'True'.
	else.
		write 'False'.
	endif.
	write: /  'sy-fdpos = ', sy-fdpos.
ENDFORM. 

FORM na1.
*   operator: NA
	write / '''AXCZ''�  na ''AB'''.     "output is �AXCZ�  na �AB�
	if '�AXCZ' na 'AB'.		         	" False	
		write 'True'.
	else.
		write 'False'.
	endif.
	write: / 'sy-fdpos = ', sy-fdpos.
ENDFORM.

FORM na2.
	write / '''ABCD''  na ''XYZ'''.    "output is �ABCD�  na �ABC�
	if 'ABCD' na 'XYZ'.		           " True	
		write 'True'.
	else.
		write 'False'.
	endif.
	write: / 'sy-fdpos = ', sy-fdpos.
ENDFORM.

FORM CP1.
* operator: CP
	IF F1 CP F2.              "True
		WRITE 'True'.
	ELSE.
		WRITE 'False'.
	ENDIF.
	WRITE: /  'sy-fdpos = ', SY-FDPOS.
ENDFORM.

FORM CP2.
* operator: CP
	IF F1 CP F3.              "True
		WRITE 'True'.
	ELSE.
		WRITE 'False'.
	ENDIF.
	WRITE: /  'sy-fdpos = ', SY-FDPOS.
ENDFORM.