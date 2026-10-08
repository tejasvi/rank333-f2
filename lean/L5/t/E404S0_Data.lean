module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E404S0 "data/lean/b3bfaa925b453f4038a60f3c1f14ef55/E404S0.bin"
namespace E404S0
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [], [], 4)], 0, E404S0.L1),
([(3, true, false, [], [], 81)], 0, E404S0.L2),
([(3, true, false, [], [], 98)], 0, E404S0.L3),
([(3, true, false, [], [], 104)], 0, E404S0.L4),
([(3, true, false, [], [], 371)], 0, E404S0.L5),
([(3, true, false, [], [], 373)], 0, E404S0.L6),
([(3, true, false, [], [], 377)], 0, E404S0.L7),
([(3, true, false, [], [], 378)], 0, E404S0.L8),
([(3, true, false, [], [], 644)], 0, E404S0.L9),
([(3, true, false, [], [], 646)], 0, E404S0.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E404S0
