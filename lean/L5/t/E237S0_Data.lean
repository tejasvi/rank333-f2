module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E237S0 "data/lean/8251e4334e5329608e9b326519865073/E237S0.bin"
namespace E237S0
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [116], [96, 488], 0)], 0, E237S0.L1),
([(8, true, false, [116], [96, 488], 1)], 0, E237S0.L2),
([(8, true, false, [116], [96, 488], 3)], 0, E237S0.L3),
([(8, true, false, [116], [96, 488], 4)], 0, E237S0.L4),
([(8, true, false, [116], [96, 488], 28)], 0, E237S0.L5),
([(8, true, false, [116], [96, 488], 29)], 0, E237S0.L6),
([(8, true, false, [116], [96, 488], 34)], 0, E237S0.L7),
([(8, true, false, [116], [96, 488], 35)], 0, E237S0.L8),
([(8, true, false, [116], [96, 488], 46)], 0, E237S0.L9),
([(8, true, false, [116], [96, 488], 48)], 0, E237S0.L10),
([(8, true, false, [116], [96, 488], 52)], 0, E237S0.L11),
([(8, true, false, [116], [96, 488], 56)], 0, E237S0.L12),
([(8, true, false, [116], [96, 488], 63)], 0, E237S0.L13),
([(8, true, false, [116], [96, 488], 64)], 0, E237S0.L14),
([(8, true, false, [116], [96, 488], 93)], 0, E237S0.L15),
([(8, true, false, [116], [96, 488], 94)], 0, E237S0.L16),
([(8, true, false, [116], [96, 488], 96)], 0, E237S0.L17)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 17
end E237S0
