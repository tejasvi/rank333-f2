module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E159S11 "data/lean/968ac2d598c1651d7499d30d62812e5b/E159S11.bin"
namespace E159S11
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(7, true, false, [254, 426, 500, 84], [160], 19)], 10, 0, E159S11.L1),
([(7, true, false, [254, 426, 500, 84], [160], 34)], 10, 0, E159S11.L2),
([(7, true, false, [254, 426, 500, 84], [160], 36)], 10, 0, E159S11.L3),
([(7, true, false, [254, 426, 500, 84], [160], 37)], 10, 0, E159S11.L4),
([(7, true, false, [254, 426, 500, 84], [160], 38)], 10, 0, E159S11.L5),
([(7, true, false, [254, 426, 500, 84], [160], 42)], 10, 0, E159S11.L6),
([(7, true, false, [254, 426, 500, 84], [160], 47)], 10, 0, E159S11.L7),
([(7, true, false, [254, 426, 500, 84], [160], 54)], 10, 0, E159S11.L8),
([(7, true, false, [254, 426, 500, 84], [160], 68)], 10, 0, E159S11.L9),
([(7, true, false, [254, 426, 500, 84], [160], 70)], 10, 0, E159S11.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E159S11
