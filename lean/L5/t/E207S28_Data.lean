module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S28 "data/lean/95c548e1e0b6db5468e548d4426de801/E207S28.bin"
namespace E207S28
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [286, 494], [80, 160], 0)], 0, E207S28.L1),
([(6, true, false, [286, 494], [80, 160], 1)], 0, E207S28.L2),
([(6, true, false, [286, 494], [80, 160], 3)], 0, E207S28.L3),
([(6, true, false, [286, 494], [80, 160], 6)], 0, E207S28.L4),
([(6, true, false, [286, 494], [80, 160], 12)], 0, E207S28.L5),
([(6, true, false, [286, 494], [80, 160], 17)], 0, E207S28.L6),
([(6, true, false, [286, 494], [80, 160], 18)], 0, E207S28.L7),
([(6, true, false, [286, 494], [80, 160], 23)], 0, E207S28.L8),
([(6, true, false, [286, 494], [80, 160], 47)], 0, E207S28.L9),
([(6, true, false, [286, 494], [80, 160], 48)], 0, E207S28.L10),
([(6, true, false, [286, 494], [80, 160], 51)], 0, E207S28.L11)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 11
end E207S28
