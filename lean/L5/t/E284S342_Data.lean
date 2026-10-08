module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S342 "data/lean/ed2675ea7b9f5437c4222701d0e375ea/E284S342.bin"
namespace E284S342
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [94, 266, 298, 382, 394, 426], [], 0)], 0, E284S342.L1),
([(3, true, false, [94, 266, 298, 382, 394, 426], [], 1)], 0, E284S342.L2),
([(3, true, false, [94, 266, 298, 382, 394, 426], [], 2)], 0, E284S342.L3),
([(3, true, false, [94, 266, 298, 382, 394, 426], [], 3)], 0, E284S342.L4),
([(3, true, false, [94, 266, 298, 382, 394, 426], [], 4)], 0, E284S342.L5),
([(3, true, false, [94, 266, 298, 382, 394, 426], [], 5)], 0, E284S342.L6),
([(3, true, false, [94, 266, 298, 382, 394, 426], [], 6)], 0, E284S342.L7),
([(3, true, false, [94, 266, 298, 382, 394, 426], [], 7)], 0, E284S342.L8),
([(3, true, false, [94, 266, 298, 382, 394, 426], [], 8)], 0, E284S342.L9),
([(3, true, false, [94, 266, 298, 382, 394, 426], [], 9)], 0, E284S342.L10),
([(3, true, false, [94, 266, 298, 382, 394, 426], [], 28)], 0, E284S342.L11),
([(3, true, false, [94, 266, 298, 382, 394, 426], [], 30)], 0, E284S342.L12),
([(3, true, false, [94, 266, 298, 382, 394, 426], [], 32)], 0, E284S342.L13),
([(3, true, false, [94, 266, 298, 382, 394, 426], [], 37)], 0, E284S342.L14),
([(3, true, false, [94, 266, 298, 382, 394, 426], [], 43)], 0, E284S342.L15)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 15
end E284S342
