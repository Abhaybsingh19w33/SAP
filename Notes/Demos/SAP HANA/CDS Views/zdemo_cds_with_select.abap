*&---------------------------------------------------------------------*
*& Report zdemo_cds_with_select
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zdemo_cds_with_select.

SELECT *
    FROM zdemo_cds_purchase_header
    INTO TABLE @DATA(it_purchase_header).

IF sy-subrc = 0.
  cl_demo_output=>display( it_purchase_header ).
ENDIF.

SELECT *
    FROM zdemo_cds_purchase_data( purc_doc_no = '4500000021',
                                  target_cur = 'CAD'
*                                  exchnage_rate_date = '20230309'
                                  )
    INTO TABLE @DATA(it_purchase_data).

IF sy-subrc = 0.
  cl_demo_output=>display( it_purchase_data ).
ENDIF.

*SELECT can't be used on Extension view
*SELECT *
*    FROM ZDEMO_CDS_PURCHASE_EX_V1
*    INTO TABLE @DATA(it_purchase_data_ext).

SELECT
    purchasing_document_number,
    \_purchase_item-item_number AS item_number,
    \_purchase_item-deletion_indicator AS deletion_indicator,
    \_purchase_item-status AS status,
    \_purchase_item-change_date AS change_date,
    \_purchase_item-short_text AS short_text,
    \_purchase_item-material_number AS material_number,
    \_purchase_item-material_number2 AS material_number2,
    \_purchase_item-company_code AS company_code,
    \_purchase_item-plant AS plant,
    \_purchase_item-storage_location AS storage_location,
    \_purchase_item-req_tracking_number AS req_tracking_number
    FROM zdemo_cds_purchase_assoc
    INTO TABLE @DATA(it_purchase_data_assoc).

IF sy-subrc = 0.
  cl_demo_output=>display( it_purchase_data_assoc ).
ENDIF.