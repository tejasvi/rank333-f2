module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S185 "data/lean/3052f7f957080fd06e6e1be378a265e7/E284S185.bin"
namespace E284S185
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [84, 116, 298], [138], 0)], 0, E284S185.L1),
([(2, true, false, [84, 116, 298], [138], 10)], 0, E284S185.L2),
([(2, true, false, [84, 116, 298], [138], 11)], 0, E284S185.L3),
([(2, true, false, [84, 116, 298], [138], 14)], 0, E284S185.L4),
([(2, true, false, [84, 116, 298], [138], 16)], 0, E284S185.L5),
([(2, true, false, [84, 116, 298], [138], 17)], 0, E284S185.L6),
([(2, true, false, [84, 116, 298], [138], 20)], 0, E284S185.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E284S185
