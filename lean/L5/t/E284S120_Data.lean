module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S120 "data/lean/5699c6368d1876214d9ef8b04143b5a2/E284S120.bin"
namespace E284S120
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [266, 426, 468, 94], [], 0)], 0, E284S120.L1),
([(3, true, false, [266, 426, 468, 94], [], 1)], 0, E284S120.L2),
([(3, true, false, [266, 426, 468, 94], [], 2)], 0, E284S120.L3),
([(3, true, false, [266, 426, 468, 94], [], 10)], 0, E284S120.L4),
([(3, true, false, [266, 426, 468, 94], [], 11)], 0, E284S120.L5),
([(3, true, false, [266, 426, 468, 94], [], 12)], 0, E284S120.L6),
([(3, true, false, [266, 426, 468, 94], [], 14)], 0, E284S120.L7),
([(3, true, false, [266, 426, 468, 94], [], 16)], 0, E284S120.L8),
([(3, true, false, [266, 426, 468, 94], [], 20)], 0, E284S120.L9),
([(3, true, false, [266, 426, 468, 94], [], 22)], 0, E284S120.L10),
([(3, true, false, [266, 426, 468, 94], [], 26)], 0, E284S120.L11),
([(3, true, false, [266, 426, 468, 94], [], 44)], 0, E284S120.L12),
([(3, true, false, [266, 426, 468, 94], [], 50)], 0, E284S120.L13),
([(3, true, false, [266, 426, 468, 94], [], 127)], 0, E284S120.L14),
([(3, true, false, [266, 426, 468, 94], [], 133)], 0, E284S120.L15)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 15
end E284S120
