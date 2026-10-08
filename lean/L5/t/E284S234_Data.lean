module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S234 "data/lean/999a9bfe3550f6aa86d8d3df453ef580/E284S234.bin"
namespace E284S234
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [212, 298, 468, 478], [138], 0)], 0, E284S234.L1),
([(2, true, false, [212, 298, 468, 478], [138], 11)], 0, E284S234.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E284S234
