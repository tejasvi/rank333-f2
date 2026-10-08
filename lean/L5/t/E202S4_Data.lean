module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E202S4 "data/lean/03c5fcf39da1f79c2ee196fcb83eab3c/E202S4.bin"
namespace E202S4
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(8, true, false, [254, 282], [176], 0)], 17, 0, E202S4.L1),
([(8, true, false, [254, 282], [176], 3)], 17, 0, E202S4.L2),
([(8, true, false, [254, 282], [176], 4)], 17, 0, E202S4.L3),
([(8, true, false, [254, 282], [176], 23)], 17, 0, E202S4.L4),
([(8, true, false, [254, 282], [176], 24)], 17, 0, E202S4.L5),
([(8, true, false, [254, 282], [176], 25)], 17, 0, E202S4.L6),
([(8, true, false, [254, 282], [176], 27)], 17, 0, E202S4.L7),
([(8, true, false, [254, 282], [176], 28)], 17, 0, E202S4.L8),
([(8, true, false, [254, 282], [176], 29)], 17, 0, E202S4.L9),
([(8, true, false, [254, 282], [176], 31)], 17, 0, E202S4.L10),
([(8, true, false, [254, 282], [176], 33)], 17, 0, E202S4.L11),
([(8, true, false, [254, 282], [176], 35)], 17, 0, E202S4.L12),
([(8, true, false, [254, 282], [176], 62)], 17, 0, E202S4.L13),
([(8, true, false, [254, 282], [176], 64)], 17, 0, E202S4.L14),
([(8, true, false, [254, 282], [176], 106)], 17, 0, E202S4.L15),
([(8, true, false, [254, 282], [176], 112)], 17, 0, E202S4.L16),
([(8, true, false, [254, 282], [176], 125)], 17, 0, E202S4.L17)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 17
end E202S4
