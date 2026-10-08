module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E185S25 "data/lean/3b84ba642a3ac5c5d59c5d6f429e4325/E185S25.bin"
namespace E185S25
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(11, true, false, [], [10, 148, 218], 10)], 4, 0, E185S25.L1),
([(11, true, false, [], [10, 148, 218], 59)], 4, 0, E185S25.L2),
([(11, true, false, [], [10, 148, 218], 69)], 4, 0, E185S25.L3),
([(11, true, false, [], [10, 148, 218], 73)], 4, 0, E185S25.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E185S25
