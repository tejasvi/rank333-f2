module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S239 "data/lean/b6fb35eae3a4deef3ce6ad1557ea4497/E236S239.bin"
namespace E236S239
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [158, 372], [136], 11)], 0, E236S239.L1),
([(0, true, false, [158, 372], [136], 15)], 0, E236S239.L2),
([(0, true, false, [158, 372], [136], 20)], 0, E236S239.L3),
([(0, true, false, [158, 372], [136], 21)], 0, E236S239.L4),
([(0, true, false, [158, 372], [136], 24)], 0, E236S239.L5),
([(0, true, false, [158, 372], [136], 31)], 0, E236S239.L6),
([(0, true, false, [158, 372], [136], 35)], 0, E236S239.L7),
([(0, true, false, [158, 372], [136], 82)], 0, E236S239.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 8
end E236S239
