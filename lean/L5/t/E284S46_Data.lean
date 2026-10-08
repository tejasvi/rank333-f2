module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S46 "data/lean/d16c68ece545f5b9624972c621a5059c/E284S46.bin"
namespace E284S46
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [84, 298], [138], 11)], 0, E284S46.L1),
([(3, true, false, [84, 298], [138], 14)], 0, E284S46.L2),
([(3, true, false, [84, 298], [138], 20)], 0, E284S46.L3),
([(3, true, false, [84, 298], [138], 27)], 0, E284S46.L4),
([(3, true, false, [84, 298], [138], 31)], 0, E284S46.L5),
([(3, true, false, [84, 298], [138], 34)], 0, E284S46.L6),
([(3, true, false, [84, 298], [138], 56)], 0, E284S46.L7),
([(3, true, false, [84, 298], [138], 73)], 0, E284S46.L8),
([(3, true, false, [84, 298], [138], 108)], 0, E284S46.L9),
([(3, true, false, [84, 298], [138], 109)], 0, E284S46.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E284S46
