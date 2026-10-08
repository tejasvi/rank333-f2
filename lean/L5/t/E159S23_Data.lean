module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E159S23 "data/lean/5221ebe51503f5d9079986f7f3571e0b/E159S23.bin"
namespace E159S23
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(4, true, false, [94, 266, 84], [510], 0)], 10, 0, E159S23.L1),
([(4, true, false, [94, 266, 84], [510], 1)], 10, 0, E159S23.L2),
([(4, true, false, [94, 266, 84], [510], 2)], 10, 0, E159S23.L3),
([(4, true, false, [94, 266, 84], [510], 3)], 10, 0, E159S23.L4),
([(4, true, false, [94, 266, 84], [510], 28)], 10, 0, E159S23.L5),
([(4, true, false, [94, 266, 84], [510], 35)], 10, 0, E159S23.L6),
([(4, true, false, [94, 266, 84], [510], 48)], 10, 0, E159S23.L7),
([(4, true, false, [94, 266, 84], [510], 60)], 10, 0, E159S23.L8),
([(4, true, false, [94, 266, 84], [510], 72)], 10, 0, E159S23.L9),
([(4, true, false, [94, 266, 84], [510], 90)], 10, 0, E159S23.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E159S23
