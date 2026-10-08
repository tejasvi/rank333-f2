module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S102 "data/lean/a209c45f6cdb3a00324d1db60d18d925/E212S102.bin"
namespace E212S102
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [158, 254, 266], [362], 0)], 0, E212S102.L1),
([(0, true, false, [158, 254, 266], [362], 1)], 0, E212S102.L2),
([(0, true, false, [158, 254, 266], [362], 2)], 0, E212S102.L3),
([(0, true, false, [158, 254, 266], [362], 39)], 0, E212S102.L4),
([(0, true, false, [158, 254, 266], [362], 46)], 0, E212S102.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E212S102
