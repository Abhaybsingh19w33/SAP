report z.

TYPES: BEGIN OF   fsname,
            firstname(25)    TYPE c,
            middlename(10)   TYPE c,
            lastname(25)     TYPE c,
	   END OF fsname.

DATA: BEGIN OF fsaddress,
        name              TYPE fsname,
        street(20)        TYPE c,
        city(25)          TYPE c,
      END OF fsaddress. 

fsaddress-name-firstname = 'Vandana'. 
fsaddress-city  = 'Mumbai'.

write fsaddress-name-firstname .
write fsaddress-city.