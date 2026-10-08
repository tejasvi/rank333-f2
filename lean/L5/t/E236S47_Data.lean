module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S47 "data/lean/4e43fbf7b200e46d3abf898efbe36459/E236S47.bin"
namespace E236S47
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(14, true, false, [354, 412], [258, 508], 27)], 0, E236S47.L1),
([(14, true, false, [354, 412], [258, 508], 31)], 0, E236S47.L2),
([(14, true, false, [354, 412], [258, 508], 44)], 0, E236S47.L3),
([(14, true, false, [354, 412], [258, 508], 53)], 0, E236S47.L4),
([(14, true, false, [354, 412], [258, 508], 82)], 0, E236S47.L5),
([(14, true, false, [354, 412], [258, 508], 114)], 0, E236S47.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E236S47
