module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S336 "data/lean/af2a37be65e9a2ffabe43b71195a522d/E236S336.bin"
namespace E236S336
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(10, true, false, [394, 372], [22, 276], 2)], 0, E236S336.L1),
([(10, true, false, [394, 372], [22, 276], 4)], 0, E236S336.L2),
([(10, true, false, [394, 372], [22, 276], 5)], 0, E236S336.L3),
([(10, true, false, [394, 372], [22, 276], 7)], 0, E236S336.L4),
([(10, true, false, [394, 372], [22, 276], 10)], 0, E236S336.L5),
([(10, true, false, [394, 372], [22, 276], 12)], 0, E236S336.L6),
([(10, true, false, [394, 372], [22, 276], 48)], 0, E236S336.L7),
([(10, true, false, [394, 372], [22, 276], 56)], 0, E236S336.L8),
([(10, true, false, [394, 372], [22, 276], 79)], 0, E236S336.L9),
([(10, true, false, [394, 372], [22, 276], 92)], 0, E236S336.L10),
([(10, true, false, [394, 372], [22, 276], 93)], 0, E236S336.L11),
([(10, true, false, [394, 372], [22, 276], 98)], 0, E236S336.L12),
([(10, true, false, [394, 372], [22, 276], 133)], 0, E236S336.L13),
([(10, true, false, [394, 372], [22, 276], 136)], 0, E236S336.L14)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 14
end E236S336
