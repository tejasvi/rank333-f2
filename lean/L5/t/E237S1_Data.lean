module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E237S1 "data/lean/6a5242835007a418024b4a02072ecff6/E237S1.bin"
namespace E237S1
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [412], [392, 488], 0)], 0, E237S1.L1),
([(6, true, false, [412], [392, 488], 3)], 0, E237S1.L2),
([(6, true, false, [412], [392, 488], 4)], 0, E237S1.L3),
([(6, true, false, [412], [392, 488], 6)], 0, E237S1.L4),
([(6, true, false, [412], [392, 488], 26)], 0, E237S1.L5),
([(6, true, false, [412], [392, 488], 42)], 0, E237S1.L6),
([(6, true, false, [412], [392, 488], 47)], 0, E237S1.L7),
([(6, true, false, [412], [392, 488], 49)], 0, E237S1.L8),
([(6, true, false, [412], [392, 488], 55)], 0, E237S1.L9),
([(6, true, false, [412], [392, 488], 66)], 0, E237S1.L10),
([(6, true, false, [412], [392, 488], 68)], 0, E237S1.L11),
([(6, true, false, [412], [392, 488], 69)], 0, E237S1.L12),
([(6, true, false, [412], [392, 488], 78)], 0, E237S1.L13),
([(6, true, false, [412], [392, 488], 92)], 0, E237S1.L14),
([(6, true, false, [412], [392, 488], 96)], 0, E237S1.L15)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 15
end E237S1
