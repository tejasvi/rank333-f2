module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S43 "data/lean/21423749df03e7cf2a7d737212593fa0/E207S43.bin"
namespace E207S43
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(11, true, false, [286, 426], [68], 2)], 0, E207S43.L1),
([(11, true, false, [286, 426], [68], 5)], 0, E207S43.L2),
([(11, true, false, [286, 426], [68], 37)], 0, E207S43.L3),
([(11, true, false, [286, 426], [68], 39)], 0, E207S43.L4),
([(11, true, false, [286, 426], [68], 41)], 0, E207S43.L5),
([(11, true, false, [286, 426], [68], 45)], 0, E207S43.L6),
([(11, true, false, [286, 426], [68], 47)], 0, E207S43.L7),
([(11, true, false, [286, 426], [68], 77)], 0, E207S43.L8),
([(11, true, false, [286, 426], [68], 92)], 0, E207S43.L9),
([(11, true, false, [286, 426], [68], 96)], 0, E207S43.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E207S43
