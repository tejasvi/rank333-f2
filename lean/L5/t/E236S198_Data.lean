module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S198 "data/lean/242eede863713b3ba3f8ec880d5c7d7f/E236S198.bin"
namespace E236S198
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [354, 254, 372], [232], 50)], 0, E236S198.L1),
([(13, true, false, [354, 254, 372], [232], 75)], 0, E236S198.L2),
([(13, true, false, [354, 254, 372], [232], 77)], 0, E236S198.L3),
([(13, true, false, [354, 254, 372], [232], 87)], 0, E236S198.L4),
([(13, true, false, [354, 254, 372], [232], 152)], 0, E236S198.L5),
([(13, true, false, [354, 254, 372], [232], 160)], 0, E236S198.L6),
([(13, true, false, [354, 254, 372], [232], 210)], 0, E236S198.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E236S198
