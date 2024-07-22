REPORT z.
* No length has to be given for complete/fixed length data type
* Date and time are complete/fixed length data type
DATA DOJ(8) TYPE D VALUE '20181231'. "YYYYMMDD
*Type D has length of 8 and cannot be changed.
*It is a complete/fixed length data type.
*Any attempt to alter it length gives an error
*If the length is given as 8, which is the default,
*the program just gives a warning and continues
DATA EXITTIME(6) TYPE T   VALUE '235945'. "HHMMSS
*Type T has length of 6 and cannot be changed.
*It is a complete/fixed length data type.
*If the length is given as 6, which is the default,
*the program just gives a warning and continues

DOJ = SY-DATUM.
EXITTIME = SY-UZEIT.
WRITE: 'The Date is ', DOJ. "DDMMYYYYY
WRITE:/'The Time is ', EXITTIME. "HHMMSS