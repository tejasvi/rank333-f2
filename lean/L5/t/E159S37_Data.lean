module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E159S37 "data/lean/85c1356e377cea31840c368c63b2e3b1/E159S37.bin"
namespace E159S37
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(2, true, false, [244, 340, 500, 84], [], 23)], 3, 0, E159S37.L1),
([(2, true, false, [244, 340, 500, 84], [], 43)], 3, 0, E159S37.L2),
([(2, true, false, [244, 340, 500, 84], [], 187)], 3, 0, E159S37.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E159S37
