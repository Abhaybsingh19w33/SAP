DATA   F1(20)   TYPE C  VALUE 'company'.
WRITE  / F1+0(3).          "output is Cap
WRITE  / F1(2).            "output is Ca, offset is 0
WRITE  / F1+2.             "output is pgemini, entire length
WRITE: / F1+2(1),F1 .      "output is p company

*+offset
*() length