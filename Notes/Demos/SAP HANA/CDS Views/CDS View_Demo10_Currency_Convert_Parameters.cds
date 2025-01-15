// =====================================
// Input  to test in eclipse

// PCURR                             USD
// PDATE                             20180101

// =====================================
@AbapCatalog.sqlViewName           : 'ZVSK_CDS1_CUR'
// DATE TO BE GIVEN IN FORMAT YYYYMMDD
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck  : #CHECK
@EndUserText.label                 : 'currency conversion'
define view ZVK_CDS1_CUR with parameters tar_cur : abap.cuky(5), exr_date : abap.dats as
  select from zadm_sales {
    vbeln,
    kunnr,
    netpr    as source_amt,
    waers    as source_cur,
    :tar_cur as tar_curr,
    currency_conversion(
      amount=>netpr, 
      source_currency=>waers, 
      target_currency=> :tar_cur, 
      exchange_rate_date=> :exr_date
    ) as tar_amt


  }

// = = = = = = = = = = = = = = = = = = SE38 PROGRAM = = = = = = = = = = = = = = = = =

// Input to begiven for SE38 program PCURR USD PDATE 01.01.2018

// = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

REPORT Z.

PARAMETERS : PCURR type WAERS, 
             PDATE type D.

SELECT * from ZVK_CDS_CUR(TAR_CUR = @PCURR,  EXr_DATE =  @PDATE  ) into TABLE @DATA (IT_TAB).

CL_DEMO_OUTPUT=>DISPLAY(IT_TAB).