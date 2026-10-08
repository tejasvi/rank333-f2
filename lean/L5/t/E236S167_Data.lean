module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S167 "data/lean/1b469448c3943f25ec670a187ce039ad/E236S167.bin"
namespace E236S167
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [254, 372], [136, 232], 1)], 0, E236S167.L1),
([(9, true, false, [254, 372], [136, 232], 8)], 0, E236S167.L2),
([(9, true, false, [254, 372], [136, 232], 10)], 0, E236S167.L3),
([(9, true, false, [254, 372], [136, 232], 16)], 0, E236S167.L4),
([(9, true, false, [254, 372], [136, 232], 34)], 0, E236S167.L5),
([(9, true, false, [254, 372], [136, 232], 47)], 0, E236S167.L6),
([(9, true, false, [254, 372], [136, 232], 49)], 0, E236S167.L7),
([(9, true, false, [254, 372], [136, 232], 121)], 0, E236S167.L8),
([(9, true, false, [254, 372], [136, 232], 126)], 0, E236S167.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E236S167
