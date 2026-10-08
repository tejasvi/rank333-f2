module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S145 "data/lean/48c6ce00d97793ecc46f32d36a554a3e/E213S145.bin"
namespace E213S145
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [106, 158], [272], 21)], 10, E213S145.L1),
([(7, true, false, [106, 158], [272], 24)], 0, E213S145.L2),
([(7, true, false, [106, 158], [272], 61)], 0, E213S145.L3),
([(7, true, false, [106, 158], [272], 72)], 0, E213S145.L4),
([(7, true, false, [106, 158], [272], 87)], 0, E213S145.L5),
([(7, true, false, [106, 158], [272], 21), (2, false, false, [], [96, 272], 576)], 0, E213S145.L6),
([(7, true, false, [106, 158], [272], 21), (2, false, false, [], [96, 272], 580)], 0, E213S145.L7),
([(7, true, false, [106, 158], [272], 21), (2, false, false, [], [96, 272], 582)], 0, E213S145.L8),
([(7, true, false, [106, 158], [272], 21), (2, false, false, [], [96, 272], 590)], 0, E213S145.L9),
([(7, true, false, [106, 158], [272], 21), (2, false, false, [], [96, 272], 1344)], 0, E213S145.L10),
([(7, true, false, [106, 158], [272], 21), (2, false, false, [], [96, 272], 1346)], 0, E213S145.L11),
([(7, true, false, [106, 158], [272], 21), (2, false, false, [], [96, 272], 1354)], 0, E213S145.L12),
([(7, true, false, [106, 158], [272], 21), (2, false, false, [], [96, 272], 1358)], 0, E213S145.L13),
([(7, true, false, [106, 158], [272], 21), (2, false, false, [], [96, 272], 2112)], 0, E213S145.L14),
([(7, true, false, [106, 158], [272], 21), (2, false, false, [], [96, 272], 2116)], 0, E213S145.L15)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E213S145
