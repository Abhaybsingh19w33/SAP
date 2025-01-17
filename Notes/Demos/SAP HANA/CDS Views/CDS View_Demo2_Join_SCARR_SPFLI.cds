@AbapCatalog.sqlViewName           : 'ZVSKCDSJOIN'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck  : #CHECK
@EndUserText.label                 : 'Z104329_CDS1_CUST_JOIN'
define view ZVK_CDS_SCARR_SPFLI as
   select from scarr SC
   left outer join spfli SP
      on SC.carrid = SP.carrid
   {
      SC.carrid,
      SC.carrname,
      SP.countryfr,
      SP.cityfrom

   };

// Note: You can use Right Outer join also in the  above syntax.
// ____________________________________
REPORT Z.

SELECT * from ZVK_CDS_SCARR_SPFLI

into TABLE
@data (IT_SALES).cl_demo_output=>display(it_sales).
