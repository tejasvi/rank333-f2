module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S333 "data/lean/28d10a42c1408cdcad2d8c92330d5371/E284S333.bin"
namespace E284S333
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [84, 116, 394, 426, 94], [], 5)], 0, E284S333.L1),
([(2, true, false, [84, 116, 394, 426, 94], [], 10)], 0, E284S333.L2),
([(2, true, false, [84, 116, 394, 426, 94], [], 22)], 0, E284S333.L3),
([(2, true, false, [84, 116, 394, 426, 94], [], 23)], 0, E284S333.L4),
([(2, true, false, [84, 116, 394, 426, 94], [], 59)], 0, E284S333.L5),
([(2, true, false, [84, 116, 394, 426, 94], [], 100)], 0, E284S333.L6),
([(2, true, false, [84, 116, 394, 426, 94], [], 112)], 0, E284S333.L7),
([(2, true, false, [84, 116, 394, 426, 94], [], 113)], 0, E284S333.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 8
end E284S333
