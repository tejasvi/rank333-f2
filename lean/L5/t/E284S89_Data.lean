module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S89 "data/lean/6f3fa5a5a2fdb6677a0bfa1cb15b52e1/E284S89.bin"
namespace E284S89
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [266, 298, 478], [138], 6)], 0, E284S89.L1),
([(8, true, false, [266, 298, 478], [138], 9)], 0, E284S89.L2),
([(8, true, false, [266, 298, 478], [138], 21)], 0, E284S89.L3),
([(8, true, false, [266, 298, 478], [138], 24)], 0, E284S89.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E284S89
