module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S104 "data/lean/71f9d8f611ca1063822ab676a37b3f35/E213S104.bin"
namespace E213S104
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [158, 494, 254], [], 10)], 0, E213S104.L1),
([(6, true, false, [158, 494, 254], [], 21)], 0, E213S104.L2),
([(6, true, false, [158, 494, 254], [], 74)], 0, E213S104.L3),
([(6, true, false, [158, 494, 254], [], 75)], 0, E213S104.L4),
([(6, true, false, [158, 494, 254], [], 76)], 0, E213S104.L5),
([(6, true, false, [158, 494, 254], [], 77)], 0, E213S104.L6),
([(6, true, false, [158, 494, 254], [], 78)], 0, E213S104.L7),
([(6, true, false, [158, 494, 254], [], 79)], 0, E213S104.L8),
([(6, true, false, [158, 494, 254], [], 80)], 0, E213S104.L9),
([(6, true, false, [158, 494, 254], [], 81)], 0, E213S104.L10),
([(6, true, false, [158, 494, 254], [], 82)], 0, E213S104.L11),
([(6, true, false, [158, 494, 254], [], 83)], 0, E213S104.L12),
([(6, true, false, [158, 494, 254], [], 217)], 0, E213S104.L13),
([(6, true, false, [158, 494, 254], [], 224)], 0, E213S104.L14)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 14
end E213S104
