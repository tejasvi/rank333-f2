module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S37 "data/lean/d2d6b20d23fa251390b56684b1aef0d3/E207S37.bin"
namespace E207S37
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [266, 494], [68], 33)], 0, E207S37.L1),
([(7, true, false, [266, 494], [68], 45)], 0, E207S37.L2),
([(7, true, false, [266, 494], [68], 48)], 0, E207S37.L3),
([(7, true, false, [266, 494], [68], 53)], 0, E207S37.L4),
([(7, true, false, [266, 494], [68], 87)], 0, E207S37.L5),
([(7, true, false, [266, 494], [68], 88)], 0, E207S37.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E207S37
