module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E185S7 "data/lean/207ee01200111d80823c3eda68c2d8b0/E185S7.bin"
namespace E185S7
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(12, true, false, [], [68, 208, 384], 0)], 2, 0, E185S7.L1),
([(12, true, false, [], [68, 208, 384], 18)], 2, 0, E185S7.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E185S7
