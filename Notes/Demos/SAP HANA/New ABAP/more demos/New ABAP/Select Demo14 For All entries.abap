Gets all flight data for a specified departure city. The relevant airlines and flight numbers are first passed to an internal table entry_tab, which is evaluated in the WHERE condition of the subsequent SELECT statement. This selection could also be carried out in a single SELECT statement by using a join in the FROM clause. Make sure that the table entry_tab is not initial before the SELECT statement is executed using FOR ALL ENTRIES. 

PARAMETERS p_city TYPE spfli-cityfrom. 

TYPES: BEGIN OF entry_tab_type, 
         carrid TYPE spfli-carrid, 
         connid   TYPE spfli-connid, 
       END OF entry_tab_type. 

TYPES: BEGIN OF result_tab_type, 
         carrid TYPE sflight-carrid, 
         connid TYPE sflight-connid, 
         fldate TYPE sflight-fldate, 
       END OF result_tab_type. 

DATA: entry_tab  TYPE TABLE OF entry_tab_type, 
      result_tab TYPE SORTED TABLE OF result_tab_type 
                      WITH UNIQUE KEY carrid connid fldate. 

SELECT carrid, connid 
       FROM spfli 
       WHERE cityfrom = @p_city 
       INTO CORRESPONDING FIELDS OF TABLE @entry_tab. 

IF entry_tab IS NOT INITIAL. 
  SELECT carrid, connid, fldate 
         FROM sflight 
         FOR ALL ENTRIES IN @entry_tab 
         WHERE carrid = @entry_tab-carrid AND 
               connid = @entry_tab-connid 
         INTO CORRESPONDING FIELDS OF TABLE @result_tab. 
ENDIF. 

