module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E237S2 "data/lean/7eaeeaa5dd94367dc42256f35d8da647/E237S2.bin"
namespace E237S2
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(10, true, false, [116, 412], [96, 392], 0)], 0, E237S2.L1),
([(10, true, false, [116, 412], [96, 392], 21)], 0, E237S2.L2),
([(10, true, false, [116, 412], [96, 392], 22)], 0, E237S2.L3),
([(10, true, false, [116, 412], [96, 392], 23)], 0, E237S2.L4),
([(10, true, false, [116, 412], [96, 392], 25)], 0, E237S2.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E237S2
