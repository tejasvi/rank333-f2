module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E237S17 "data/lean/df3b91ddbf51f0f947b07747e4c2f11c/E237S17.bin"
namespace E237S17
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [116, 412], [20], 0)], 0, E237S17.L1),
([(4, true, false, [116, 412], [20], 6)], 0, E237S17.L2),
([(4, true, false, [116, 412], [20], 7)], 0, E237S17.L3),
([(4, true, false, [116, 412], [20], 9)], 0, E237S17.L4),
([(4, true, false, [116, 412], [20], 19)], 0, E237S17.L5),
([(4, true, false, [116, 412], [20], 21)], 0, E237S17.L6),
([(4, true, false, [116, 412], [20], 22)], 0, E237S17.L7),
([(4, true, false, [116, 412], [20], 27)], 0, E237S17.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 8
end E237S17
