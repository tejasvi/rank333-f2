module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E202S17 "data/lean/54ff8c78734950f6dcebf064d4587dbd/E202S17.bin"
namespace E202S17
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(11, true, false, [282, 426, 494], [], 5)], 5, 0, E202S17.L1),
([(11, true, false, [282, 426, 494], [], 11)], 5, 0, E202S17.L2),
([(11, true, false, [282, 426, 494], [], 15)], 5, 0, E202S17.L3),
([(11, true, false, [282, 426, 494], [], 17)], 5, 0, E202S17.L4),
([(11, true, false, [282, 426, 494], [], 158)], 5, 0, E202S17.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E202S17
