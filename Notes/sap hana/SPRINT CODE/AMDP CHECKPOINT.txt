*&---------------------------------------------------------------------*
*& Report Z7689_AMDP
*&---------------------------------------------------------------------*
** Author            : ABHAY B SINGH
** SAP ID            : TRAINEE11
** USERID            : ABHBHAGW
** Creation Date     : 29-08-2022
** Package           : ZYNY_ABHAY_SAP_HANA
** TR Number         : LS4K907251
** Functional Module : MM
** RICEFW ID         : 21
** Object Descriptio : DISPLAY PRODUCTION ORDER DETAILS ALONG WITH PLANT
**                     AND ORDER ITEM IN THE AMDP.
*&---------------------------------------------------------------------*
REPORT Z7689_AMDP.

* DATA HAS BEEN TAKEN FROM TABLE: T001W, AUFK, AFPO.
TABLES: T001W, AUFK, AFPO.
**
**DATA(o_amdp) = NEW Z7659_AMDP_S2_DP( )." Object creation
**
**
**PARAMETERS: p_lifnr TYPE Z7659_lfa1-lifnr.
**
**START-OF-SELECTION.
**
**o_amdp->get_data(
**  EXPORTING in_lifnr = p_lifnr
**  IMPORTING
**    out_zvendor =  DATA(it_vendor) ).  " GET_DATA method call
**
**cl_demo_output=>display( it_vendor ).

SELECT-OPTIONS S_WERKS FOR T001W-WERKS.  "MATCHCODE OBJECT Z7659_LFA1_SH.

START-OF-SELECTION.

DATA(O_REF) = NEW  z7689_amdp( ). ##Needed  " Object creation(O_REF Object)

DATA(S_FILTER) = CL_SHDB_SELTAB=>COMBINE_SELTABS(
       IT_NAMED_SELTABS = VALUE #( ( NAME = 'WERKS' DREF = REF #( S_WERKS[] ) ) ) ).

O_REF->GET_PUR(
EXPORTING     ##NEEDED
      PLANTS = S_FILTER
      IM_MANDT = SY-MANDT
      IM_SPRAS = SY-LANGU
IMPORTING
      IT_RES      = DATA(ITAB) ).         "GET_DATA method call

  CL_DEMO_OUTPUT=>DISPLAY(
EXPORTING DATA = ITAB
            NAME = 'PRODUCTION ORDER'
).