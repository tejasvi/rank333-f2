module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S192 "data/lean/dfd197a0901e4883defd912d4f8ec77c/E284S192.bin"
namespace E284S192
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [84, 372, 382], [222], 20)], 0, E284S192.L1),
([(0, true, false, [84, 372, 382], [222], 22)], 0, E284S192.L2),
([(0, true, false, [84, 372, 382], [222], 23)], 0, E284S192.L3),
([(0, true, false, [84, 372, 382], [222], 24)], 0, E284S192.L4),
([(0, true, false, [84, 372, 382], [222], 32)], 0, E284S192.L5),
([(0, true, false, [84, 372, 382], [222], 59)], 0, E284S192.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E284S192
