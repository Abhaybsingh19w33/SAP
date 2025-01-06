REPORT ZYNY_REPORTING_EVENT_01.
*The HIDE keyword is used to store data objects and their values so they can be made available when the User selects a report line.

DATA:
  it_mara TYPE TABLE  OF mara,
  wa_mara TYPE mara.

SELECT * FROM mara INTO  TABLE it_mara UP TO 10 ROWS.

LOOP AT it_mara INTO wa_mara.
  WRITE : / wa_mara-matnr.
  HIDE wa_mara-matnr.
ENDLOOP.

AT LINE-SELECTION.
  WRITE /: 'This is secondary list:', SY-LSIND.
  WRITE /: 'Customer number is :', WA_mara-matnr.