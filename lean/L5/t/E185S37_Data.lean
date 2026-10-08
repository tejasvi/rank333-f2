module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E185S37 "data/lean/0c9a0a4b1732a565e644f646b06bd169/E185S37.bin"
namespace E185S37
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(12, true, false, [286], [78], 64)], 4, 0, E185S37.L1),
([(12, true, false, [286], [78], 67)], 4, 0, E185S37.L2),
([(12, true, false, [286], [78], 70)], 4, 0, E185S37.L3),
([(12, true, false, [286], [78], 79)], 4, 0, E185S37.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E185S37
