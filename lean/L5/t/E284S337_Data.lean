module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S337 "data/lean/9d9c5d29aff91cc01f85e03f715057c9/E284S337.bin"
namespace E284S337
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(16, true, false, [84, 298, 468, 212, 340, 426], [], 44)], 0, E284S337.L1),
([(16, true, false, [84, 298, 468, 212, 340, 426], [], 115)], 0, E284S337.L2),
([(16, true, false, [84, 298, 468, 212, 340, 426], [], 227)], 0, E284S337.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E284S337
