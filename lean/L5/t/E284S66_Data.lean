module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S66 "data/lean/4e0d2923dc913a8c32924d04bbb43ae8/E284S66.bin"
namespace E284S66
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [212, 298], [138], 0)], 0, E284S66.L1),
([(3, true, false, [212, 298], [138], 14)], 0, E284S66.L2),
([(3, true, false, [212, 298], [138], 20)], 0, E284S66.L3),
([(3, true, false, [212, 298], [138], 21)], 0, E284S66.L4),
([(3, true, false, [212, 298], [138], 22)], 0, E284S66.L5),
([(3, true, false, [212, 298], [138], 24)], 0, E284S66.L6),
([(3, true, false, [212, 298], [138], 25)], 0, E284S66.L7),
([(3, true, false, [212, 298], [138], 26)], 0, E284S66.L8),
([(3, true, false, [212, 298], [138], 29)], 0, E284S66.L9),
([(3, true, false, [212, 298], [138], 41)], 0, E284S66.L10),
([(3, true, false, [212, 298], [138], 44)], 0, E284S66.L11),
([(3, true, false, [212, 298], [138], 68)], 0, E284S66.L12),
([(3, true, false, [212, 298], [138], 86)], 0, E284S66.L13),
([(3, true, false, [212, 298], [138], 92)], 0, E284S66.L14),
([(3, true, false, [212, 298], [138], 123)], 0, E284S66.L15)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 15
end E284S66
