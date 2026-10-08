module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S346 "data/lean/57f9e642e76e8ca5c3fb7a70a3c13efe/E284S346.bin"
namespace E284S346
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [94, 116, 340, 382, 84, 372], [], 5)], 0, E284S346.L1),
([(4, true, false, [94, 116, 340, 382, 84, 372], [], 7)], 0, E284S346.L2),
([(4, true, false, [94, 116, 340, 382, 84, 372], [], 8)], 0, E284S346.L3),
([(4, true, false, [94, 116, 340, 382, 84, 372], [], 9)], 0, E284S346.L4),
([(4, true, false, [94, 116, 340, 382, 84, 372], [], 25)], 0, E284S346.L5),
([(4, true, false, [94, 116, 340, 382, 84, 372], [], 72)], 0, E284S346.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E284S346
