module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E242S0 "data/lean/7eb3a7cde5fbfbc9f0bcb4d6c0ab72a7/E242S0.bin"
namespace E242S0
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [177, 267, 478, 382], [], 31)], 0, E242S0.L1),
([(4, true, false, [177, 267, 478, 382], [], 35)], 0, E242S0.L2),
([(4, true, false, [177, 267, 478, 382], [], 40)], 0, E242S0.L3),
([(4, true, false, [177, 267, 478, 382], [], 49)], 0, E242S0.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E242S0
