module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S48 "data/lean/b9e70379d2764577ee2d3a7005937d1f/E213S48.bin"
namespace E213S48
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [106, 494, 244], [378], 2)], 0, E213S48.L1),
([(0, true, false, [106, 494, 244], [378], 3)], 0, E213S48.L2),
([(0, true, false, [106, 494, 244], [378], 4)], 0, E213S48.L3),
([(0, true, false, [106, 494, 244], [378], 6)], 0, E213S48.L4),
([(0, true, false, [106, 494, 244], [378], 7)], 0, E213S48.L5),
([(0, true, false, [106, 494, 244], [378], 9)], 0, E213S48.L6),
([(0, true, false, [106, 494, 244], [378], 12)], 0, E213S48.L7),
([(0, true, false, [106, 494, 244], [378], 13)], 0, E213S48.L8),
([(0, true, false, [106, 494, 244], [378], 14)], 0, E213S48.L9),
([(0, true, false, [106, 494, 244], [378], 16)], 0, E213S48.L10),
([(0, true, false, [106, 494, 244], [378], 17)], 0, E213S48.L11),
([(0, true, false, [106, 494, 244], [378], 20)], 0, E213S48.L12),
([(0, true, false, [106, 494, 244], [378], 74)], 0, E213S48.L13),
([(0, true, false, [106, 494, 244], [378], 76)], 0, E213S48.L14)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 14
end E213S48
