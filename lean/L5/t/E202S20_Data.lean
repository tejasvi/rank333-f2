module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E202S20 "data/lean/cd0f498881f47c19d22eb3d7a969b009/E202S20.bin"
namespace E202S20
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(6, true, false, [254, 282, 340, 244], [], 1)], 9, 0, E202S20.L1),
([(6, true, false, [254, 282, 340, 244], [], 4)], 9, 0, E202S20.L2),
([(6, true, false, [254, 282, 340, 244], [], 44)], 9, 0, E202S20.L3),
([(6, true, false, [254, 282, 340, 244], [], 45)], 9, 0, E202S20.L4),
([(6, true, false, [254, 282, 340, 244], [], 49)], 9, 0, E202S20.L5),
([(6, true, false, [254, 282, 340, 244], [], 58)], 9, 0, E202S20.L6),
([(6, true, false, [254, 282, 340, 244], [], 60)], 9, 0, E202S20.L7),
([(6, true, false, [254, 282, 340, 244], [], 78)], 9, 0, E202S20.L8),
([(6, true, false, [254, 282, 340, 244], [], 80)], 9, 0, E202S20.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E202S20
