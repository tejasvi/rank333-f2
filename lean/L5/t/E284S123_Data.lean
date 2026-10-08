module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S123 "data/lean/178df9da5f02455034544e711ce5fb9c/E284S123.bin"
namespace E284S123
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [266, 372, 426, 94], [], 0)], 0, E284S123.L1),
([(3, true, false, [266, 372, 426, 94], [], 1)], 0, E284S123.L2),
([(3, true, false, [266, 372, 426, 94], [], 3)], 0, E284S123.L3),
([(3, true, false, [266, 372, 426, 94], [], 4)], 0, E284S123.L4),
([(3, true, false, [266, 372, 426, 94], [], 10)], 0, E284S123.L5),
([(3, true, false, [266, 372, 426, 94], [], 12)], 0, E284S123.L6),
([(3, true, false, [266, 372, 426, 94], [], 20)], 0, E284S123.L7),
([(3, true, false, [266, 372, 426, 94], [], 22)], 0, E284S123.L8),
([(3, true, false, [266, 372, 426, 94], [], 49)], 0, E284S123.L9),
([(3, true, false, [266, 372, 426, 94], [], 50)], 0, E284S123.L10),
([(3, true, false, [266, 372, 426, 94], [], 52)], 0, E284S123.L11),
([(3, true, false, [266, 372, 426, 94], [], 55)], 0, E284S123.L12),
([(3, true, false, [266, 372, 426, 94], [], 105)], 0, E284S123.L13),
([(3, true, false, [266, 372, 426, 94], [], 107)], 0, E284S123.L14),
([(3, true, false, [266, 372, 426, 94], [], 129)], 0, E284S123.L15)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 15
end E284S123
