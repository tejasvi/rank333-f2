module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S140 "data/lean/dc75598b6347d4a866ff42e1a1a6d269/E284S140.bin"
namespace E284S140
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [212, 298, 394], [138], 0)], 0, E284S140.L1),
([(3, true, false, [212, 298, 394], [138], 11)], 0, E284S140.L2),
([(3, true, false, [212, 298, 394], [138], 14)], 0, E284S140.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E284S140
