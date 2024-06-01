*&---------------------------------------------------------------------*
*& Report ZYNY_11_CONCAT_ALPHA_ITAB
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZYNY_11_CONCAT_ALPHA_ITAB.

*Link - https://discoveringabap.com/2021/11/04/abap-7-4-and-beyond-11-concatenation-alpha-and-itab-lines/

*In this post, you will learn about below ABAP statements.

*-> ALPHA
*-> Concatenation
*-> LINE_EXISTS
*-> LINES

*As you can see this post has miscellaneous and unrelated statements 
*but I did not wanted to post multiple ones for each of them.

*ALPHA
*ALPHA adds leading zeroes to strings of digits or removes them. This 
*only works for data types string, c or n. Usually SAP stores data with 
*leading zeros for many fields like Customer Number, Order Number, 
*Invoice Number, but while printing the data on output screen the 
*leading zeros are removed.

*For Removing Leading Zeros

DATA : var_int TYPE char10 VALUE '0000098765'.

DATA(var_ext) = |{ var_int ALPHA = OUT }|.

"This code replaces use of CONVERSION_EXIT
DATA var_ext TYPE char10.
CALL FUNCTION 'CONVERSION_EXIT_ALPHA_OUTPUT' 
  EXPORTING
    input  = var_int
  IMPORTING
    output = var_ext.  

*For Adding Leading Zeros

DATA : var_ext TYPE char10 VALUE '12345'.

DATA(var_int) = |{ var_ext ALPHA = IN }|.

"This code replaces use of CONVERSION_EXIT
DATA var_int TYPE char10.
CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT' 
  EXPORTING
    input  = var_ext
  IMPORTING
    output = var_int.

*Note that the variables var_int and var_ext can be the same variable.

var_num = |{ var_num ALPHA = OUT }|.   "Remove leading zeros
var_num = |{ var_num ALPHA = IN }|.    "Add leading zeros 
*This can also be used as an operand.

WRITE : |{ var_int ALPHA = OUT }|.
Note that this syntax only works for conversion routine ALPHA.

*Concatenation
*We all know concatenation. So let us just look at examples.

"Single Variable 
CONCATENATE 'The order' order_num 'is created successfully'
  INTO DATA(msg)
  SEPARATED BY space.

"Multiple Variables
CONCATENATE 'The order' order_num 'is created on' sy-datum 'at' 
sy-uzeit 'by' sy-uname
  INTO DATA(msg)
  SEPARATED BY space.

*This can now be written in a way which is more readable as below.

"Single Variable 
DATA(msg) = |The order { order_num } is created successfully|.

"Multiple Variables
DATA(msg) = |The order { order_num } is created on { sy-datum } at { 
sy-uzeit } by { sy-uname } |.

*As we are talking about concatenation, you should know below method as 
*well.

DATA(created_at) = sy-datum && ':' && sy-uzeit.

*Chaining Operator
WRITE : / 'Chaining Operator'.
DATA: v_var1 TYPE char30,
      v_var2 TYPE char30,
      v_var3 TYPE char30.

DATA : lv_result TYPE string.

v_var1 = 'Building'.
v_var2 = 'A'.
v_var3 = 'String'.

lv_result = v_var1 && v_var2 && v_var3.
WRITE : / 'Using &&', lv_result.

*String Templates
WRITE : / 'String Templates'.
DATA: character_string TYPE string.
character_string = |This is a literal text.|.

WRITE :/ character_string.
*LINE_EXISTS
*LINE_EXISTS is used to check whether a record exists in internal table 
*or not.

*This can also be done using READ TABLE as below.

"Select data from sbook table
SELECT * FROM sbook INTO TABLE @DATA(it_sbook).

"Code in focus
READ TABLE it_sbook TRANSPORTING NO FIELDS WITH KEY carrid = 'AA'.
IF sy-subrc EQ 0.
  WRITE: 'Booking found for flight AA'.
ELSE.
  WRITE: 'Booking not found for flight AA'.
ENDIF.

*The same can be written using the new read syntax as below.

TRY.
    DATA(ls_sook) = it_sbook[ carrid = 'AA' ].
    WRITE: 'Booking found for flight AA'.
  CATCH cx_sy_itab_line_not_found.
    WRITE: 'Booking not found for flight AA'.
ENDTRY.

*But the best way when you only have to check for record existence is 
*to use LINE_EXISTS.

IF LINE_EXISTS( it_sbook[ carrid = 'AA' ] ).
  WRITE: 'Booking found for flight AA'.
ELSE.
  WRITE: 'Booking not found for flight AA'.
ENDIF.

*LINES
*This needs no explaination.

"Old way
DESCRIBE TABLE it_sbook LINES DATA(lv_count).

"New way
DATA(lv_count) = LINES( it_sbook ). 

"Use in operand positions
WRITE: / 'No. of bookings: ', LINES( it_sbook ).