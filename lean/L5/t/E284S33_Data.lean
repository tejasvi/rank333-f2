module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S33 "data/lean/a03f6111d37322e16dfa44fe507cd1b6/E284S33.bin"
namespace E284S33
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [254, 426, 212], [138], 0)], 0, E284S33.L1),
([(8, true, false, [254, 426, 212], [138], 11)], 0, E284S33.L2),
([(8, true, false, [254, 426, 212], [138], 14)], 0, E284S33.L3),
([(8, true, false, [254, 426, 212], [138], 21)], 0, E284S33.L4),
([(8, true, false, [254, 426, 212], [138], 25)], 0, E284S33.L5),
([(8, true, false, [254, 426, 212], [138], 31)], 0, E284S33.L6),
([(8, true, false, [254, 426, 212], [138], 79)], 0, E284S33.L7),
([(8, true, false, [254, 426, 212], [138], 80)], 0, E284S33.L8),
([(8, true, false, [254, 426, 212], [138], 81)], 0, E284S33.L9),
([(8, true, false, [254, 426, 212], [138], 82)], 0, E284S33.L10),
([(8, true, false, [254, 426, 212], [138], 86)], 0, E284S33.L11),
([(8, true, false, [254, 426, 212], [138], 96)], 0, E284S33.L12),
([(8, true, false, [254, 426, 212], [138], 115)], 0, E284S33.L13),
([(8, true, false, [254, 426, 212], [138], 122)], 0, E284S33.L14)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 14
end E284S33
