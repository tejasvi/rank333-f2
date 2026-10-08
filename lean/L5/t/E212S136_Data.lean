module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S136 "data/lean/aa714cc1436e1849d2820f714e4db4dc/E212S136.bin"
namespace E212S136
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(10, true, false, [158, 122], [96, 368], 1)], 0, E212S136.L1),
([(10, true, false, [158, 122], [96, 368], 2)], 0, E212S136.L2),
([(10, true, false, [158, 122], [96, 368], 8)], 0, E212S136.L3),
([(10, true, false, [158, 122], [96, 368], 10)], 0, E212S136.L4),
([(10, true, false, [158, 122], [96, 368], 11)], 0, E212S136.L5),
([(10, true, false, [158, 122], [96, 368], 31)], 0, E212S136.L6),
([(10, true, false, [158, 122], [96, 368], 33)], 0, E212S136.L7),
([(10, true, false, [158, 122], [96, 368], 39)], 0, E212S136.L8),
([(10, true, false, [158, 122], [96, 368], 43)], 0, E212S136.L9),
([(10, true, false, [158, 122], [96, 368], 53)], 0, E212S136.L10),
([(10, true, false, [158, 122], [96, 368], 54)], 0, E212S136.L11),
([(10, true, false, [158, 122], [96, 368], 60)], 0, E212S136.L12),
([(10, true, false, [158, 122], [96, 368], 63)], 0, E212S136.L13),
([(10, true, false, [158, 122], [96, 368], 74)], 0, E212S136.L14),
([(10, true, false, [158, 122], [96, 368], 110)], 0, E212S136.L15),
([(10, true, false, [158, 122], [96, 368], 121)], 0, E212S136.L16),
([(10, true, false, [158, 122], [96, 368], 122)], 0, E212S136.L17),
([(10, true, false, [158, 122], [96, 368], 124)], 0, E212S136.L18),
([(10, true, false, [158, 122], [96, 368], 127)], 0, E212S136.L19),
([(10, true, false, [158, 122], [96, 368], 128)], 0, E212S136.L20),
([(10, true, false, [158, 122], [96, 368], 131)], 0, E212S136.L21),
([(10, true, false, [158, 122], [96, 368], 152)], 0, E212S136.L22)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 22
end E212S136
