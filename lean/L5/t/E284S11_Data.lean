module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S11 "data/lean/127582962c658d0d4c94cbc48130c5c7/E284S11.bin"
namespace E284S11
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [468], [10, 126], 0)], 0, E284S11.L1),
([(9, true, false, [468], [10, 126], 1)], 0, E284S11.L2),
([(9, true, false, [468], [10, 126], 4)], 0, E284S11.L3),
([(9, true, false, [468], [10, 126], 5)], 0, E284S11.L4),
([(9, true, false, [468], [10, 126], 8)], 0, E284S11.L5),
([(9, true, false, [468], [10, 126], 15)], 0, E284S11.L6),
([(9, true, false, [468], [10, 126], 22)], 0, E284S11.L7),
([(9, true, false, [468], [10, 126], 23)], 0, E284S11.L8),
([(9, true, false, [468], [10, 126], 49)], 0, E284S11.L9),
([(9, true, false, [468], [10, 126], 50)], 0, E284S11.L10),
([(9, true, false, [468], [10, 126], 53)], 0, E284S11.L11),
([(9, true, false, [468], [10, 126], 56)], 0, E284S11.L12),
([(9, true, false, [468], [10, 126], 59)], 0, E284S11.L13),
([(9, true, false, [468], [10, 126], 69)], 0, E284S11.L14),
([(9, true, false, [468], [10, 126], 73)], 0, E284S11.L15),
([(9, true, false, [468], [10, 126], 106)], 0, E284S11.L16),
([(9, true, false, [468], [10, 126], 115)], 0, E284S11.L17),
([(9, true, false, [468], [10, 126], 116)], 0, E284S11.L18),
([(9, true, false, [468], [10, 126], 126)], 0, E284S11.L19),
([(9, true, false, [468], [10, 126], 131)], 0, E284S11.L20),
([(9, true, false, [468], [10, 126], 133)], 0, E284S11.L21)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 21
end E284S11
