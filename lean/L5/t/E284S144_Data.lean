module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S144 "data/lean/34608233a60d8d4996b1934df9870b29/E284S144.bin"
namespace E284S144
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [84, 212, 266, 298, 394, 426], [], 0)], 0, E284S144.L1),
([(3, true, false, [84, 212, 266, 298, 394, 426], [], 1)], 0, E284S144.L2),
([(3, true, false, [84, 212, 266, 298, 394, 426], [], 2)], 0, E284S144.L3),
([(3, true, false, [84, 212, 266, 298, 394, 426], [], 4)], 0, E284S144.L4),
([(3, true, false, [84, 212, 266, 298, 394, 426], [], 5)], 0, E284S144.L5),
([(3, true, false, [84, 212, 266, 298, 394, 426], [], 6)], 0, E284S144.L6),
([(3, true, false, [84, 212, 266, 298, 394, 426], [], 8)], 0, E284S144.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E284S144
