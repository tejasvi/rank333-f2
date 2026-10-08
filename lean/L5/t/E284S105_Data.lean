module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S105 "data/lean/7fcbd36afa4d5a7c4ecf9f89c06402b3/E284S105.bin"
namespace E284S105
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [266, 468], [138], 0)], 0, E284S105.L1),
([(3, true, false, [266, 468], [138], 1)], 0, E284S105.L2),
([(3, true, false, [266, 468], [138], 2)], 0, E284S105.L3),
([(3, true, false, [266, 468], [138], 4)], 0, E284S105.L4),
([(3, true, false, [266, 468], [138], 7)], 0, E284S105.L5),
([(3, true, false, [266, 468], [138], 10)], 0, E284S105.L6),
([(3, true, false, [266, 468], [138], 11)], 0, E284S105.L7),
([(3, true, false, [266, 468], [138], 12)], 0, E284S105.L8),
([(3, true, false, [266, 468], [138], 14)], 0, E284S105.L9),
([(3, true, false, [266, 468], [138], 30)], 0, E284S105.L10),
([(3, true, false, [266, 468], [138], 31)], 0, E284S105.L11),
([(3, true, false, [266, 468], [138], 34)], 0, E284S105.L12),
([(3, true, false, [266, 468], [138], 44)], 0, E284S105.L13),
([(3, true, false, [266, 468], [138], 78)], 0, E284S105.L14),
([(3, true, false, [266, 468], [138], 79)], 0, E284S105.L15),
([(3, true, false, [266, 468], [138], 112)], 0, E284S105.L16)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 16
end E284S105
