module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S154 "data/lean/e9239c8514301bef10c31583bd2304f9/E284S154.bin"
namespace E284S154
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [84, 298, 394, 94], [], 0)], 0, E284S154.L1),
([(3, true, false, [84, 298, 394, 94], [], 2)], 0, E284S154.L2),
([(3, true, false, [84, 298, 394, 94], [], 4)], 0, E284S154.L3),
([(3, true, false, [84, 298, 394, 94], [], 10)], 0, E284S154.L4),
([(3, true, false, [84, 298, 394, 94], [], 42)], 0, E284S154.L5),
([(3, true, false, [84, 298, 394, 94], [], 89)], 0, E284S154.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E284S154
