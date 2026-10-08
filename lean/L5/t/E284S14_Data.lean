module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S14 "data/lean/8626694317fa757486a8e565cca7131c/E284S14.bin"
namespace E284S14
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [254, 394, 84], [138], 0)], 0, E284S14.L1),
([(9, true, false, [254, 394, 84], [138], 7)], 0, E284S14.L2),
([(9, true, false, [254, 394, 84], [138], 34)], 0, E284S14.L3),
([(9, true, false, [254, 394, 84], [138], 41)], 0, E284S14.L4),
([(9, true, false, [254, 394, 84], [138], 79)], 0, E284S14.L5),
([(9, true, false, [254, 394, 84], [138], 80)], 0, E284S14.L6),
([(9, true, false, [254, 394, 84], [138], 81)], 0, E284S14.L7),
([(9, true, false, [254, 394, 84], [138], 82)], 0, E284S14.L8),
([(9, true, false, [254, 394, 84], [138], 85)], 0, E284S14.L9),
([(9, true, false, [254, 394, 84], [138], 94)], 0, E284S14.L10),
([(9, true, false, [254, 394, 84], [138], 113)], 0, E284S14.L11),
([(9, true, false, [254, 394, 84], [138], 120)], 0, E284S14.L12)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 12
end E284S14
