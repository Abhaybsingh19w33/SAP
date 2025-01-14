*&---------------------------------------------------------------------*
*& Report  ZVKCALLINGPGM
*&
*&---------------------------------------------------------------------*

REPORT  ZVKCALLINGPGM.
write : / 'before calling'.
submit zvkcalledpgm VIA SELECTION-SCREEN.
and return.
"call TRANSACTION 'SE11'.
*LEAVE TO  TRANSACTION 'SE11'.
write : / 'After calling'.

*&---------------------------------------------------------------------*
*& Report  ZVKCALLEDPGM
*&
*&---------------------------------------------------------------------*

REPORT  ZVKCALLEDPGM.
PARAMETERS: num1 type i DEFAULT 10.
write : / 'This is the called pgm', num1.

write : / 'Called pgm complete'.