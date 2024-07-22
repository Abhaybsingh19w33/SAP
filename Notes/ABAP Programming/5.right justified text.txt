Report z.

"By default, values from numeric variables are right justified/aligned & 
"values from non-numeric variables are left justified/aligned & 
"the same can be changed while output if required.

DATA v_name(10) TYPE C VALUE 'gemini'.

Output : gemini

Write / v_name LEFT-JUSTIFIED.
Write / v_name RIGHT-JUSTIFIED.
Write / v_name CENTERED.