module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S95 "data/lean/5ff38b319898bfd1a3b80a5946cf5f0d/E284S95.bin"
namespace E284S95
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [84, 298, 254], [138], 20)], 0, E284S95.L1),
([(3, true, false, [84, 298, 254], [138], 34)], 0, E284S95.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E284S95
