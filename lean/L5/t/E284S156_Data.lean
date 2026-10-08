module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S156 "data/lean/39b788da79d3c95c8761805425cb2abb/E284S156.bin"
namespace E284S156
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [84, 212, 266, 394, 94], [], 0)], 0, E284S156.L1),
([(3, true, false, [84, 212, 266, 394, 94], [], 1)], 0, E284S156.L2),
([(3, true, false, [84, 212, 266, 394, 94], [], 2)], 0, E284S156.L3),
([(3, true, false, [84, 212, 266, 394, 94], [], 4)], 0, E284S156.L4),
([(3, true, false, [84, 212, 266, 394, 94], [], 15)], 0, E284S156.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E284S156
