*&---------------------------------------------------------------------*
*& Report ZYNY_10_DEBUG_ABAP_EXPR
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZYNY_10_DEBUG_ABAP_EXPR.

*Link - https://discoveringabap.com/2021/11/02/abap-7-4-and-beyond-10-debugging-complex-abap-expressions/#google_vignette

*ABAP expressions are easy write and are usually shorter than earlier 
*syntax they replace, but understanding code written using expressions 
*is bit more difficult and takes time.

*Debugging it seems lot more difficult as lot of things happen in a 
*single statement.

*In this post, you will learn about a ABAP debugging feature that helps 
*in debugging ABAP expressions.

*Consider below code which builds a table for display using the FOR 
*iteration for tables.

targets = 
  VALUE #( FOR book IN bookings 
           ( carrid = book-carrid
             carrnm = carriers[ carrid = book-carrid ]-carrname        
             connid = booking-connid
             fldate = booking-fldate
             custom = customers[ id = booking-customid ]-name 
           ) 
         ).

*There are couple of reads within the statement. While debugging this 
*statement, it gets executed in one go.

*Link - https://discoveringabap.com/ezoimgfmt/discoveringabap.files.wordpress.com/2021/11/debugger2_1.jpg?ezimgfmt=ng:webp/ngcb2

*Both F5 and F6 have the same effect i.e. the entire statement is 
*executed at once and you get the target table populated.

*We are used to conventional LOOP AT statement where debugging each 
*iteration in a loop is possible.

LOOP AT bookings INTO booking.
...
ENDLOOP.

*Good news is that SAP GUI New debugger has a feature that helps here. 
*Bad news is that Eclipse debugger does not have this feature yet.

*To check individual loop iteration you have to enable the Step Debugger.

*How to enable the Step Debugger?
*Click on the Step Size in the toolbar to enable / disable Step Debugger.

*Link - https://discoveringabap.com/ezoimgfmt/discoveringabap.files.wordpress.com/2021/11/debugger2_3.jpg?ezimgfmt=ng:webp/ngcb2

*While enabling the Step Debugger, you will get a message 'Debugger 
*increment changed to subcondition/statement'.

*Link - https://discoveringabap.com/ezoimgfmt/discoveringabap.files.wordpress.com/2021/11/debugger2_4.jpg?ezimgfmt=ng:webp/ngcb2

*Now, if you use F5 (Single Step) at the VALUE # statement, you can get 
*the result of individual loop iteration. Here is an example of 3/7 
*table entries added after 3rd iterations.

*Link - https://discoveringabap.com/ezoimgfmt/discoveringabap.files.wordpress.com/2021/11/debugger2_5.jpg?ezimgfmt=ng:webp/ngcb2

*To change this back, just press the button again.

*Summary

*The step size button can be checked easily to execute one iteration at 
*a time.