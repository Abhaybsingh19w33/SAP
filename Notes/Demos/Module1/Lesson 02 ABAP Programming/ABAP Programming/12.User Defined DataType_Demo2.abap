report z.

types mystreet(25)  type c.

data street type mystreet.
street = '44,  Road'.

*Similarly remaining types
"could have been created
types: begin of address,
		street(25) type c,
		city(20)  type c,
		region(7),
		country(15),
		postalcode(9),
	   end of address.

data: 	customeraddr	type address,
		vendoraddr	 	type address,
		employeeaddr 	type address,
		shiptoaddr		type address.

customeraddr-street = '44, road'.
employeeaddr-country = 'India'.

Write: /  customeraddr-street,
		  employeeaddr-country.