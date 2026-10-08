module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E386S0 "data/lean/e0e3bd1fa409c7cc8bdf7a4bc10ee0fc/E386S0.bin"
namespace E386S0
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [], [], 5)], 0, E386S0.L1),
([(9, true, false, [], [], 55)], 0, E386S0.L2),
([(9, true, false, [], [], 101)], 0, E386S0.L3),
([(9, true, false, [], [], 103)], 0, E386S0.L4),
([(9, true, false, [], [], 322)], 0, E386S0.L5),
([(9, true, false, [], [], 326)], 0, E386S0.L6),
([(9, true, false, [], [], 327)], 0, E386S0.L7),
([(9, true, false, [], [], 329)], 0, E386S0.L8),
([(9, true, false, [], [], 599)], 0, E386S0.L9),
([(9, true, false, [], [], 644)], 0, E386S0.L10),
([(9, true, false, [], [], 647)], 0, E386S0.L11),
([(9, true, false, [], [], 649)], 0, E386S0.L12),
([(9, true, false, [], [], 669)], 0, E386S0.L13)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 13
end E386S0
