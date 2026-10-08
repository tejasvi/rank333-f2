module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E237S10 "data/lean/e135240e58350ee6731d9b788eddade6/E237S10.bin"
namespace E237S10
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [116], [392, 488], 4)], 0, E237S10.L1),
([(9, true, false, [116], [392, 488], 7)], 0, E237S10.L2),
([(9, true, false, [116], [392, 488], 9)], 0, E237S10.L3),
([(9, true, false, [116], [392, 488], 27)], 0, E237S10.L4),
([(9, true, false, [116], [392, 488], 43)], 0, E237S10.L5),
([(9, true, false, [116], [392, 488], 44)], 0, E237S10.L6),
([(9, true, false, [116], [392, 488], 46)], 0, E237S10.L7),
([(9, true, false, [116], [392, 488], 48)], 5, E237S10.L8),
([(9, true, false, [116], [392, 488], 54)], 0, E237S10.L9),
([(9, true, false, [116], [392, 488], 58)], 0, E237S10.L10),
([(9, true, false, [116], [392, 488], 67)], 0, E237S10.L11),
([(9, true, false, [116], [392, 488], 68)], 0, E237S10.L12),
([(9, true, false, [116], [392, 488], 71)], 0, E237S10.L13),
([(9, true, false, [116], [392, 488], 72)], 0, E237S10.L14),
([(9, true, false, [116], [392, 488], 74)], 0, E237S10.L15),
([(9, true, false, [116], [392, 488], 93)], 0, E237S10.L16),
([(9, true, false, [116], [392, 488], 94)], 0, E237S10.L17),
([(9, true, false, [116], [392, 488], 96)], 0, E237S10.L18),
([(9, true, false, [116], [392, 488], 104)], 0, E237S10.L19),
([(9, true, false, [116], [392, 488], 118)], 0, E237S10.L20),
([(9, true, false, [116], [392, 488], 122)], 0, E237S10.L21),
([(9, true, false, [116], [392, 488], 150)], 0, E237S10.L22),
([(9, true, false, [116], [392, 488], 154)], 0, E237S10.L23),
([(9, true, false, [116], [392, 488], 48), (10, false, false, [], [392, 488], 576)], 0, E237S10.L24),
([(9, true, false, [116], [392, 488], 48), (10, false, false, [], [392, 488], 640)], 0, E237S10.L25),
([(9, true, false, [116], [392, 488], 48), (10, false, false, [], [392, 488], 1336)], 0, E237S10.L26),
([(9, true, false, [116], [392, 488], 48), (10, false, false, [], [392, 488], 1352)], 0, E237S10.L27),
([(9, true, false, [116], [392, 488], 48), (10, false, false, [], [392, 488], 1984)], 0, E237S10.L28)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 23
end E237S10
