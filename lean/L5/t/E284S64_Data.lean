module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S64 "data/lean/6af8062d9b46843c186bbe065b27ba6d/E284S64.bin"
namespace E284S64
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [84, 298], [138], 11)], 0, E284S64.L1),
([(3, true, false, [84, 298], [138], 14)], 0, E284S64.L2),
([(3, true, false, [84, 298], [138], 15)], 0, E284S64.L3),
([(3, true, false, [84, 298], [138], 16)], 0, E284S64.L4),
([(3, true, false, [84, 298], [138], 20)], 0, E284S64.L5),
([(3, true, false, [84, 298], [138], 27)], 0, E284S64.L6),
([(3, true, false, [84, 298], [138], 31)], 0, E284S64.L7),
([(3, true, false, [84, 298], [138], 34)], 0, E284S64.L8),
([(3, true, false, [84, 298], [138], 56)], 0, E284S64.L9),
([(3, true, false, [84, 298], [138], 73)], 0, E284S64.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E284S64
