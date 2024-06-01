*&---------------------------------------------------------------------*
*& Report ZYNY_SEND_EMAILS_WITH_EXCEL_AT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zyny_send_emails_with_excel_at.

*Link - https://discoveringabap.com/2021/11/20/abap-code-samples-send-xslx-attachment-using-cl_bcs/

*Sending email from ABAP is a very common requirement in SAP ABAP. It
*is a simple code to write unless there is an attachment. But, if you
*have to send an XLSX attachment then writing a code that works
*perfectly is extremely difficult.

*You will either

*-> Convince users to use a .CSV file or
*-> Have an additional pop-up saying its in not excel content or
*-> Open the content in one single column in excel or
*-> Just see some junk characters when you open the attachment

*In this post, I will share the secret of sending emails with .xlsx
*attachment with OO ABAP and using 7.4+ syntax. This code does not use
*any FMs like SO_NEW_DOCUMENT_ATT_SEND_API1.

*Before we move to the code, take a look at below image. This will help
*you understand the code flow as each of the node(with boxes) is
*created separately by calling methods of the classes CL_BCS and
*CL_DOCUMENT_BCS.

*Link - https://discoveringabap.com/ezoimgfmt/discoveringabap.files.wordpress.com/2021/11/email.jpg?ezimgfmt=ng:webp/ngcb2

****************************FORMAT**************************************
*Node
*Description
*Class Reference
****************************FORMAT**************************************
*Send Request
*Primary object used create and send an email
*CL_BCS
************************************************************************
*Document
*Subject, body and attachment
*CL_DOCUMENT_BCS
************************************************************************
*Sender
*Sender i.e. From email address
*IF_SENDER_BCS
************************************************************************
*Recipient
*Recipient i.e. To email address
*IF_RECIPIENT_BCS
************************************************************************
*Attachment
*This has a Type, Subject, Name, Size and Content
*–
************************************************************************

*So now, let us look at the code.

CLASS zcl_send_oo_email DEFINITION
  PUBLIC FINAL CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS send_email .
ENDCLASS.

CLASS zcl_send_oo_email IMPLEMENTATION.

  METHOD send_email.

    "Get Data
    SELECT * FROM /dmo/flight INTO TABLE @DATA(lt_data).
    GET REFERENCE OF lt_data INTO DATA(lo_data_ref).
    DATA(lv_xstring) = NEW zcl_itab_to_excel( )->itab_to_xstring(
lo_data_ref ).

*--- Email code starts here
    TRY.
        "Create send request
        DATA(lo_send_request) = cl_bcs=>create_persistent( ).

        "Create mail body
        DATA(lt_body) = VALUE bcsy_text(
                          ( line = 'Dear Recipient,' ) ( )
                          ( line = 'PFA flight details file.' ) ( )
                          ( line = 'Thank You' )
                        ).

        "Set up document object
        DATA(lo_document) = cl_document_bcs=>create_document(
                              i_type = 'RAW'
                              i_text = lt_body
                              i_subject = 'Flight Details' ).

        "Add attachment
        lo_document->add_attachment(
            i_attachment_type    = 'xls'
            i_attachment_size    = CONV #( xstrlen( lv_xstring ) )
            i_attachment_subject = 'Flight Details'
            i_attachment_header  = VALUE #( ( line = 'Flights.xlsx' ) )
            i_att_content_hex    = cl_bcs_convert=>xstring_to_solix(
lv_xstring )
         ).

        "Add document to send request
        lo_send_request->set_document( lo_document ).

        "Set sender
        lo_send_request->set_sender(
          cl_cam_address_bcs=>create_internet_address(
            i_address_string = CONV #( 'sender@dummy.com' )
          )
        ).

        "Set Recipient | This method has options to set CC/BCC as well
        lo_send_request->add_recipient(
          i_recipient = cl_cam_address_bcs=>create_internet_address(
                          i_address_string = CONV #(
'recipient@dummy.com' )
                        )
          i_express   = abap_true ).

        "Send Email
        DATA(lv_sent_to_all) = lo_send_request->send( ).
        COMMIT WORK.

      CATCH cx_send_req_bcs INTO DATA(lx_req_bsc).
        "Error handling
      CATCH cx_document_bcs INTO DATA(lx_doc_bcs).
        "Error handling
      CATCH cx_address_bcs  INTO DATA(lx_add_bcs).
        "Error handling
    ENDTRY.

  ENDMETHOD.
ENDCLASS.
*In case you are wondering where is the code for class
*zcl_itab_to_excel. This was covered in earlier post to write excel
*file on application server.

*Link - https://discoveringabap.com/2021/11/08/abap-code-samples-write-internal-table-as-excel-file-on-sap-application-server/
*Here is the code for quick reference

CLASS zcl_itab_to_excel DEFINITION PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS:
      itab_to_xstring
        IMPORTING ir_data_ref       TYPE REF TO data
        RETURNING VALUE(rv_xstring) TYPE xstring.
ENDCLASS.

CLASS zcl_itab_to_excel IMPLEMENTATION.
  METHOD itab_to_xstring.

    FIELD-SYMBOLS: <fs_data> TYPE ANY TABLE.

    CLEAR rv_xstring.
    ASSIGN ir_data_ref->* TO <fs_data>.

    TRY.
        cl_salv_table=>factory(
          IMPORTING r_salv_table = DATA(lo_table)
          CHANGING  t_table      = <fs_data> ).

        DATA(lt_fcat) =
          cl_salv_controller_metadata=>get_lvc_fieldcatalog(
            r_columns      = lo_table->get_columns( )
            r_aggregations = lo_table->get_aggregations( ) ).

        DATA(lo_result) =
          cl_salv_ex_util=>factory_result_data_table(
            r_data         = ir_data_ref
            t_fieldcatalog = lt_fcat ).

        cl_salv_bs_tt_util=>if_salv_bs_tt_util~transform(
          EXPORTING
            xml_type      = if_salv_bs_xml=>c_type_xlsx
            xml_version   = cl_salv_bs_a_xml_base=>get_version( )
            r_result_data = lo_result
            xml_flavour   = if_salv_bs_c_tt=>c_tt_xml_flavour_export
            gui_type      = if_salv_bs_xml=>c_gui_type_gui
          IMPORTING
            xml           = rv_xstring ).
      CATCH cx_root.
        CLEAR rv_xstring.
    ENDTRY.
  ENDMETHOD.
ENDCLASS.

*Email in transaction code SOST.

*Link - https://discoveringabap.com/ezoimgfmt/discoveringabap.files.wordpress.com/2021/11/image-45.png?ezimgfmt=ng:webp/ngcb2

*On display further,

*Link - https://discoveringabap.com/ezoimgfmt/discoveringabap.files.wordpress.com/2021/11/image-46.png?ezimgfmt=ng:webp/ngcb2

*The attachment opens without any isue.

*Link - https://discoveringabap.com/ezoimgfmt/discoveringabap.files.wordpress.com/2021/11/image-47.png?ezimgfmt=ng%3Awebp%2Fngcb2%2Frs%3Adevice%2Frscb2-1

*The same code can be use to create other attachments as well or emails
*without attachments, email with CC/BCC as well.