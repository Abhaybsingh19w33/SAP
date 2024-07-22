REPORT  Z104329PGM2.

DATA iVar1 TYPE I VALUE 121.
DATA pVar1 TYPE P DECIMALS 2 VALUE '121.23'.
DATA cVar1(3) TYPE C VALUE 'ABC'.
DATA cVar2(6) TYPE C VALUE 'ABCDEF'.

DATA cVar3(3) TYPE C VALUE '564'. 
DATA cVar4(6) TYPE C VALUE '23456'.

*iVar1 = cVar1. "does not work as cVar1 contains alphabets
*WRITE iVar1.
*
*pVar1 = cVar2. "does not work as cVar2 contains alphabets
*WRITE  / pVar1.
"Above 2 statements give runtime error

iVar1 = cVar3. "Works as cVar3 contains numbers
WRITE iVar1.
*
pVar1 = cVar4. "Works as cVar4 contains numbers
WRITE  / pVar1.