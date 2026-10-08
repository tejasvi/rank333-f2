module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S334 "data/lean/91d7f40b5b28050edf4061df30454fd6/E284S334.bin"
namespace E284S334
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [84, 212, 298, 426, 94], [], 0)], 0, E284S334.L1),
([(2, true, false, [84, 212, 298, 426, 94], [], 5)], 0, E284S334.L2),
([(2, true, false, [84, 212, 298, 426, 94], [], 6)], 0, E284S334.L3),
([(2, true, false, [84, 212, 298, 426, 94], [], 7)], 0, E284S334.L4),
([(2, true, false, [84, 212, 298, 426, 94], [], 9)], 0, E284S334.L5),
([(2, true, false, [84, 212, 298, 426, 94], [], 10)], 0, E284S334.L6),
([(2, true, false, [84, 212, 298, 426, 94], [], 11)], 0, E284S334.L7),
([(2, true, false, [84, 212, 298, 426, 94], [], 15)], 0, E284S334.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 8
end E284S334
