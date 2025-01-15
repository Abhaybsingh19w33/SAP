* Works on LD2
REPORT Z.

DATA: carrid TYPE spfli-carrid, 
      connid TYPE spfli-connid. 

WRITE: 10 'Carrier', 40 'Connection'. 
ULINE. 

SELECT carrid, connid 
       FROM spfli 
       INTO (@carrid, @connid). 
  WRITE: / carrid UNDER 'Carrier', 
           connid UNDER 'Connection'. 
ENDSELECT. 