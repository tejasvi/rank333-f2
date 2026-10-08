module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S282 "data/lean/e857fbe628fc92a9141d4d99cf7504ce/E236S282.bin"
namespace E236S282
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [158, 254, 354, 394], [], 0)], 0, E236S282.L1),
([(2, true, false, [158, 254, 354, 394], [], 15)], 0, E236S282.L2),
([(2, true, false, [158, 254, 354, 394], [], 17)], 0, E236S282.L3),
([(2, true, false, [158, 254, 354, 394], [], 22)], 0, E236S282.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E236S282
