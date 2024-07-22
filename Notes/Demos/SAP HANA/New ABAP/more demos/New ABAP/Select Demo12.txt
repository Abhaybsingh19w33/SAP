Reads flights with a primary key that corresponds to the user entries on the selection screen. 

DATA spfli_wa TYPE spfli. 

SELECT-OPTIONS: s_carrid FOR spfli_wa-carrid NO INTERVALS 
                                             NO-EXTENSION, 
                s_connid FOR spfli_wa-connid NO INTERVALS 
                                             NO-EXTENSION. 

SELECT SINGLE * 
       FROM spfli 
       WHERE carrid IN @s_carrid AND 
             connid IN @s_connid 
       INTO @spfli_wa
