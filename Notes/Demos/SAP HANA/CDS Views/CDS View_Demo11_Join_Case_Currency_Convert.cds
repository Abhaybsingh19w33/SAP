// =========================================
// Input  on running se 38 program
// PCURR                             USD
// PDATE                             20180101

// =====================================
@AbapCatalog.sqlViewName           : 'ZVSK_CDS2_CUR'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck  : #CHECK
@EndUserText.label                 : 'join with currency befores association'
define view ZVK_CDS2_CUR with parameters tar_curr : abap.cuky(5), ex_date : abap.dats as
   select from zadm_kna1_rav as k
   inner join zadm_sales as s
      on k.kunnr = s.kunnr
   {
      k.kunnr,
      k.aedat,
      s.waers as source_amt,
      s.vbeln,
      s.netpr as amount,
      currency_conversion(
         amount=>netpr, source_currency=>waers, target_currency=> :tar_curr, exchange_rate_date=> :ex_date
      )       as tgt_amount,
      case
         when
            netpr <= 100000
         then
            'low'
         when
            netpr between 100001 and 300000
         then
            'medium'
         when
            netpr > 300000
         then
            'high'
         else
            'NA'
      end     as prty
   }

// ==================SE38 PROGRAM=================

// Input to begiven for SE38 program
// PCURR                             USD
// PDATE                             01.01.2018

// =====================================

REPORT ZTR_ACCESS_CDS_CON.
PARAMETERS: PCURR TYPE WAERS,
            PDATE TYPE D.

SELECT * FROM ZVK_CDS2_CUR( TAR_CURr = @PCURR , EX_DATE = @PDATE )
   INTO TABLE @DATA(IT_TAB).


CL_DEMO_OUTPUT=>DISPLAY(  IT_TAB ).