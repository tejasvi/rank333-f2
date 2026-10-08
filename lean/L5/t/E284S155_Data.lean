module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S155 "data/lean/d51bc784a03eda5d2a11c94a03dc8e35/E284S155.bin"
namespace E284S155
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [84, 116, 266, 298, 94], [], 0)], 0, E284S155.L1),
([(3, true, false, [84, 116, 266, 298, 94], [], 1)], 0, E284S155.L2),
([(3, true, false, [84, 116, 266, 298, 94], [], 5)], 0, E284S155.L3),
([(3, true, false, [84, 116, 266, 298, 94], [], 57)], 0, E284S155.L4),
([(3, true, false, [84, 116, 266, 298, 94], [], 97)], 0, E284S155.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E284S155
