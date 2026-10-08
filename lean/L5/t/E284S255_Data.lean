module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S255 "data/lean/be1972ab8302aa3b6fc546941adf0da3/E284S255.bin"
namespace E284S255
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(10, true, false, [84, 468], [], 10)], 0, E284S255.L1),
([(10, true, false, [84, 468], [], 88)], 0, E284S255.L2),
([(10, true, false, [84, 468], [], 89)], 0, E284S255.L3),
([(10, true, false, [84, 468], [], 90)], 0, E284S255.L4),
([(10, true, false, [84, 468], [], 91)], 0, E284S255.L5),
([(10, true, false, [84, 468], [], 92)], 0, E284S255.L6),
([(10, true, false, [84, 468], [], 93)], 0, E284S255.L7),
([(10, true, false, [84, 468], [], 94)], 0, E284S255.L8),
([(10, true, false, [84, 468], [], 95)], 0, E284S255.L9),
([(10, true, false, [84, 468], [], 96)], 0, E284S255.L10),
([(10, true, false, [84, 468], [], 97)], 0, E284S255.L11),
([(10, true, false, [84, 468], [], 101)], 0, E284S255.L12),
([(10, true, false, [84, 468], [], 103)], 0, E284S255.L13),
([(10, true, false, [84, 468], [], 104)], 0, E284S255.L14),
([(10, true, false, [84, 468], [], 167)], 0, E284S255.L15),
([(10, true, false, [84, 468], [], 252)], 0, E284S255.L16),
([(10, true, false, [84, 468], [], 253)], 0, E284S255.L17)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 17
end E284S255
