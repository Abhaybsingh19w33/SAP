report ZVKBDC_DEFAULT_RECORDING
       no standard page heading line-size 255.
include bdcrecx1.
start-of-selection.
perform open_group.
perform bdc_dynpro      using 'SAPLMGMM' '0060'.
perform bdc_field       using 'BDC_CURSOR'
                              'RMMG1-MTART'.
perform bdc_field       using 'BDC_OKCODE'
                              '=ENTR'.
perform bdc_field       using 'RMMG1-MATNR'
                              'BDC_MAT2'.
perform bdc_field       using 'RMMG1-MBRSH'
                              '1'.
perform bdc_field       using 'RMMG1-MTART'
                              'FERT'.
perform bdc_dynpro      using 'SAPLMGMM' '0070'.
perform bdc_field       using 'BDC_CURSOR'
                              'MSICHTAUSW-DYTXT(01)'.
perform bdc_field       using 'BDC_OKCODE'
                              '=ENTR'.
perform bdc_field       using 'MSICHTAUSW-KZSEL(01)'
                              'X'.
perform bdc_dynpro      using 'SAPLMGMM' '4004'.
perform bdc_field       using 'BDC_OKCODE'
                              '=BU'.
perform bdc_field       using 'MAKT-MAKTX'
                              'Sample Material for BDC'.
perform bdc_field       using 'BDC_CURSOR'
                              'MARA-MATKL'.
perform bdc_field       using 'MARA-MEINS'
                              'KG'.
perform bdc_field       using 'MARA-MATKL'
                              '01'.
perform bdc_field       using 'MARA-MTPOS_MARA'
                              'NORM'.
perform bdc_transaction using 'MM01'.
perform close_group.