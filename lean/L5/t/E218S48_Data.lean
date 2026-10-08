module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S48 "data/lean/1fae063cc5ecec5ba0c1dba94b311f07/E218S48.bin"
namespace E218S48
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [266, 500], [228], 5)], 0, E218S48.L1),
([(9, true, false, [266, 500], [228], 11)], 0, E218S48.L2),
([(9, true, false, [266, 500], [228], 17)], 0, E218S48.L3),
([(9, true, false, [266, 500], [228], 41)], 0, E218S48.L4),
([(9, true, false, [266, 500], [228], 43)], 0, E218S48.L5),
([(9, true, false, [266, 500], [228], 49)], 0, E218S48.L6),
([(9, true, false, [266, 500], [228], 61)], 0, E218S48.L7),
([(9, true, false, [266, 500], [228], 78)], 0, E218S48.L8),
([(9, true, false, [266, 500], [228], 81)], 0, E218S48.L9),
([(9, true, false, [266, 500], [228], 84)], 0, E218S48.L10),
([(9, true, false, [266, 500], [228], 85)], 0, E218S48.L11),
([(9, true, false, [266, 500], [228], 92)], 0, E218S48.L12),
([(9, true, false, [266, 500], [228], 109)], 0, E218S48.L13),
([(9, true, false, [266, 500], [228], 122)], 0, E218S48.L14),
([(9, true, false, [266, 500], [228], 147)], 0, E218S48.L15),
([(9, true, false, [266, 500], [228], 154)], 0, E218S48.L16),
([(9, true, false, [266, 500], [228], 160)], 0, E218S48.L17),
([(9, true, false, [266, 500], [228], 233)], 0, E218S48.L18)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 18
end E218S48
