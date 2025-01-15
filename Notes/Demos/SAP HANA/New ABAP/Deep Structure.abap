REPORT Z.
"
TYPES:
  BEGIN OF TY_DEEP,
    KUNNR TYPE KUNNR,
    NAME1 TYPE NAME1,
    ORT01 TYPE ORT01,
    T_COL TYPE LVC_T_SCOL,
  END OF TY_DEEP.

TYPES: TTY_DEEP TYPE STANDARD TABLE OF TY_DEEP WITH DEFAULT KEY.

DATA(LV1) = NEW TTY_DEEP((
                            KUNNR = '100111'
                            NAME1 = 'John'
                            ORT01 = 'AMS'
                            T_COL = VALUE #(
                                            ( FNAME = 'ABC' COLOR-COL = 4 COLOR-INV = 1 COLOR-INT = 2 )
                                            ( FNAME = 'LMN' COLOR-COL = 4 COLOR-INV = 1 COLOR-INT = 2 )
                                           )
                          )
                          (
                            KUNNR = '200222'
                            NAME1 = 'Raj'
                            ORT01 = 'CAL'
                            T_COL = VALUE #(
                                          ( FNAME = 'PQR' COLOR-COL = 4 COLOR-INV = 1 COLOR-INT = 2 )
                                          ( FNAME = 'XYZ' COLOR-COL = 4 COLOR-INV = 1 COLOR-INT = 2 )
                                          )
                          )).
BREAK-POINT.