module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S79 "data/lean/08760c97aad0b7e274e346c20080462f/E284S79.bin"
namespace E284S79
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(10, true, false, [288], [], 0), (5, false, false, [], [], 0)], 0, E284S79.L1),
([(10, true, false, [288], [], 0), (5, false, false, [], [], 1)], 0, E284S79.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E284S79
