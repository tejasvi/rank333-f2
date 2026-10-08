module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E237S8 "data/lean/39a415d1773a124a20e934ecb81738e2/E237S8.bin"
namespace E237S8
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [354], [96, 392], 2)], 0, E237S8.L1),
([(9, true, false, [354], [96, 392], 40)], 0, E237S8.L2),
([(9, true, false, [354], [96, 392], 48)], 0, E237S8.L3),
([(9, true, false, [354], [96, 392], 59)], 0, E237S8.L4),
([(9, true, false, [354], [96, 392], 71)], 0, E237S8.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E237S8
