module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E237S5 "data/lean/d7cb57ad8bc283f8c6f313781fa63313/E237S5.bin"
namespace E237S5
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [116, 234], [96, 392], 0)], 0, E237S5.L1),
([(9, true, false, [116, 234], [96, 392], 2)], 0, E237S5.L2),
([(9, true, false, [116, 234], [96, 392], 10)], 0, E237S5.L3),
([(9, true, false, [116, 234], [96, 392], 42)], 0, E237S5.L4),
([(9, true, false, [116, 234], [96, 392], 44)], 0, E237S5.L5),
([(9, true, false, [116, 234], [96, 392], 46)], 0, E237S5.L6),
([(9, true, false, [116, 234], [96, 392], 48)], 0, E237S5.L7),
([(9, true, false, [116, 234], [96, 392], 50)], 0, E237S5.L8),
([(9, true, false, [116, 234], [96, 392], 59)], 0, E237S5.L9),
([(9, true, false, [116, 234], [96, 392], 60)], 0, E237S5.L10),
([(9, true, false, [116, 234], [96, 392], 63)], 0, E237S5.L11),
([(9, true, false, [116, 234], [96, 392], 71)], 0, E237S5.L12)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 12
end E237S5
