REPORT ZTR_CDS_VIEW.

  SELECT  *
  FROM ZTR_CDS_JOIN

  INTO TABLE @data(IT_SALES).
  cl_demo_output=>display( it_sales ).