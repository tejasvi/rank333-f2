module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E202S11 "data/lean/444c98b7200deca39ba680b93e542b70/E202S11.bin"
namespace E202S11
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(5, true, false, [340], [10, 272], 5)], 3, 0, E202S11.L1),
([(5, true, false, [340], [10, 272], 9)], 3, 0, E202S11.L2),
([(5, true, false, [340], [10, 272], 24)], 3, 0, E202S11.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E202S11
