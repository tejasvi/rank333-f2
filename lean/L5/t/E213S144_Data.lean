module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S144 "data/lean/d0576be684686d75f8d18e1e8374f19f/E213S144.bin"
namespace E213S144
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [158, 254, 282], [272], 0)], 0, E213S144.L1),
([(8, true, false, [158, 254, 282], [272], 7)], 0, E213S144.L2),
([(8, true, false, [158, 254, 282], [272], 10)], 0, E213S144.L3),
([(8, true, false, [158, 254, 282], [272], 13)], 0, E213S144.L4),
([(8, true, false, [158, 254, 282], [272], 14)], 0, E213S144.L5),
([(8, true, false, [158, 254, 282], [272], 15)], 0, E213S144.L6),
([(8, true, false, [158, 254, 282], [272], 16)], 0, E213S144.L7),
([(8, true, false, [158, 254, 282], [272], 17)], 0, E213S144.L8),
([(8, true, false, [158, 254, 282], [272], 19)], 0, E213S144.L9),
([(8, true, false, [158, 254, 282], [272], 22)], 0, E213S144.L10),
([(8, true, false, [158, 254, 282], [272], 32)], 0, E213S144.L11),
([(8, true, false, [158, 254, 282], [272], 33)], 0, E213S144.L12),
([(8, true, false, [158, 254, 282], [272], 38)], 0, E213S144.L13),
([(8, true, false, [158, 254, 282], [272], 53)], 0, E213S144.L14),
([(8, true, false, [158, 254, 282], [272], 62)], 0, E213S144.L15),
([(8, true, false, [158, 254, 282], [272], 68)], 0, E213S144.L16),
([(8, true, false, [158, 254, 282], [272], 73)], 0, E213S144.L17),
([(8, true, false, [158, 254, 282], [272], 82)], 0, E213S144.L18)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 18
end E213S144
