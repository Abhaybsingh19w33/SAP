REPORT z.
DATA src_iVar1 TYPE I VALUE 22.
DATA src_iVar2 TYPE I VALUE 2147483647.
DATA tgt_pVar1 TYPE P DECIMALS 2.
DATA tgt_pVar2 TYPE P DECIMALS 6.

MOVE src_iVar1 TO tgt_pVar1.
WRITE tgt_pVar1.

MOVE src_iVar2 TO tgt_pVar2.
WRITE / tgt_pVar2.