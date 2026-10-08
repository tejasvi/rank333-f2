module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E237S4 "data/lean/b639506de3368d507549d466337b50c6/E237S4.bin"
namespace E237S4
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [116, 354], [392], 0)], 0, E237S4.L1),
([(9, true, false, [116, 354], [392], 10)], 0, E237S4.L2),
([(9, true, false, [116, 354], [392], 11)], 0, E237S4.L3),
([(9, true, false, [116, 354], [392], 13)], 0, E237S4.L4),
([(9, true, false, [116, 354], [392], 16)], 0, E237S4.L5),
([(9, true, false, [116, 354], [392], 17)], 0, E237S4.L6),
([(9, true, false, [116, 354], [392], 32)], 0, E237S4.L7),
([(9, true, false, [116, 354], [392], 118)], 0, E237S4.L8),
([(9, true, false, [116, 354], [392], 119)], 0, E237S4.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E237S4
