data: f1    type  p  decimals 3 value '1575.456'.
start-of-selection.
write:      /  f1,			20 'as-is', 		  "output is 1,575.456
            / f1  decimals 4,	20 'decimals 4',  "output is 1,575.4560
            / f1  decimals 3,	20 'decimals 3',  "output is 1,575.456
            / f1  decimals 2,	20 'decimals 2',  "output is 1,575.46
            / f1  decimals 1,	20 'decimals 1',  "output is 1,575.5
            / f1  decimals 0,	20 'decimals 0',  "output is 1,575

            / f1  round  4,		20 'round  4',    "output is 0.158  " f*0.0001...as it is decimals thre.. third digit gts rounded off
            / f1  round  3,		20 'round  3',    "output is 1.575  "f*0.001
            / f1  round  2,		20 'round  2',    "output is 15.755
            / f1  round  1,		20 'round  1',    "output is 157.546
            / f1  round  0,		20 'round  0'.    "output is 1,575.456