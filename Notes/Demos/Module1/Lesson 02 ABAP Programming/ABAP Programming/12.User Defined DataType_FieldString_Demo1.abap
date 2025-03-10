REPORT SAP.

types:	char2	    type c,
		dollars(16)	type p decimals 2,
		lira(16)	type p decimals 0. "Italian lira have no decimals

data  v1 type char2	value 'AB'.

data:   begin of american_sums,
			petty_cash	type dollars,
			pay_outs	type dollars,
			lump_sums	type dollars,
		end of american_sums,

		begin of italian_sums,
			petty_cash	type lira,
			pay_outs	type lira,
			lump_sums	type lira,
		end of italian_sums.

start-of-selection.
	write v1.
	american_sums-pay_outs = '9500.03'. "Need quotes when literal contains decimal
	italian_sums-lump_sums  = 9555.

	write : / american_sums-pay_outs, 	"output 9,500.00
			  italian_sums-lump_sums.	"output 9,555