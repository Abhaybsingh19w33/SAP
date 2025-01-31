@AbapCatalog.sqlViewName           : 'ZVSK_CDS_PARA'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck  : #CHECK
@EndUserText.label                 : 'ZVK_CDS_PARAMETERS'
define view ZVK_CDS_PARAMETERS with parameters PCARRID : abap.char(3) as
    select from scarr {
        carrid,
        carrname,
        currcode,
        url
    }
    where
        carrid = :PCARRID

// ____________________________________________________

@AbapCatalog.sqlViewName           : 'ZVSK_CDS_PARA'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck  : #CHECK
@EndUserText.label                 : 'ZVK_CDS_PARAMETERS'
define view ZVK_CDS_PARAMETERS with parameters PCARRID : s_carr_id // DATA ELEMENT
as
    select from scarr {
        carrid,
        carrname,
        currcode,
        url
    }
    where
        carrid = :PCARRID

// ________________________________________

REPORT Z.

SELECT * FROM
  ZVK_CDS_PARAMETERS( PCARRID = 'AA' )
   INTO TABLE @DATA(IT_TAB).

CL_DEMO_OUTPUT=>DISPLAY(  IT_TAB ).

The hardcoded value AA can be a parameter in SE38


// _______________________________________________________
REPORT z.
PARAMETERS PSCARRID TYPE S_CARR_ID.
SELECT * FROM
  ZVK_CDS_PARAMETERS( PCARRID = @PSCARRID )
   INTO TABLE @DATA(IT_TAB).

CL_DEMO_OUTPUT=>DISPLAY(  IT_TAB ).
