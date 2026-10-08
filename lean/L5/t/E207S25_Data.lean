module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S25 "data/lean/3575bb6e06653ed269f0327e25935262/E207S25.bin"
namespace E207S25
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [286, 494], [80, 160], 0)], 0, E207S25.L1),
([(4, true, false, [286, 494], [80, 160], 3)], 0, E207S25.L2),
([(4, true, false, [286, 494], [80, 160], 6)], 0, E207S25.L3),
([(4, true, false, [286, 494], [80, 160], 12)], 0, E207S25.L4),
([(4, true, false, [286, 494], [80, 160], 15)], 0, E207S25.L5),
([(4, true, false, [286, 494], [80, 160], 17)], 0, E207S25.L6),
([(4, true, false, [286, 494], [80, 160], 18)], 0, E207S25.L7),
([(4, true, false, [286, 494], [80, 160], 47)], 0, E207S25.L8),
([(4, true, false, [286, 494], [80, 160], 48)], 0, E207S25.L9),
([(4, true, false, [286, 494], [80, 160], 51)], 0, E207S25.L10),
([(4, true, false, [286, 494], [80, 160], 61)], 0, E207S25.L11)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 11
end E207S25
