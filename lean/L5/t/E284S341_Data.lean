module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S341 "data/lean/716e42579e043cd1b915a09b4735f002/E284S341.bin"
namespace E284S341
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [94, 266, 298, 394, 426, 478], [], 0)], 0, E284S341.L1),
([(3, true, false, [94, 266, 298, 394, 426, 478], [], 2)], 0, E284S341.L2),
([(3, true, false, [94, 266, 298, 394, 426, 478], [], 5)], 0, E284S341.L3),
([(3, true, false, [94, 266, 298, 394, 426, 478], [], 6)], 0, E284S341.L4),
([(3, true, false, [94, 266, 298, 394, 426, 478], [], 9)], 0, E284S341.L5),
([(3, true, false, [94, 266, 298, 394, 426, 478], [], 16)], 0, E284S341.L6),
([(3, true, false, [94, 266, 298, 394, 426, 478], [], 18)], 0, E284S341.L7),
([(3, true, false, [94, 266, 298, 394, 426, 478], [], 22)], 0, E284S341.L8),
([(3, true, false, [94, 266, 298, 394, 426, 478], [], 39)], 0, E284S341.L9),
([(3, true, false, [94, 266, 298, 394, 426, 478], [], 43)], 0, E284S341.L10),
([(3, true, false, [94, 266, 298, 394, 426, 478], [], 46)], 0, E284S341.L11),
([(3, true, false, [94, 266, 298, 394, 426, 478], [], 53)], 0, E284S341.L12),
([(3, true, false, [94, 266, 298, 394, 426, 478], [], 54)], 0, E284S341.L13),
([(3, true, false, [94, 266, 298, 394, 426, 478], [], 65)], 0, E284S341.L14),
([(3, true, false, [94, 266, 298, 394, 426, 478], [], 66)], 0, E284S341.L15)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 15
end E284S341
