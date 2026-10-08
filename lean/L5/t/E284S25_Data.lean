module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S25 "data/lean/b244daa6f5a7655a1fec20ffb8cbde34/E284S25.bin"
namespace E284S25
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [382, 394, 372], [138], 11)], 0, E284S25.L1),
([(9, true, false, [382, 394, 372], [138], 31)], 0, E284S25.L2),
([(9, true, false, [382, 394, 372], [138], 43)], 0, E284S25.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E284S25
