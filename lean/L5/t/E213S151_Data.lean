module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S151 "data/lean/7e6750d8cf827dbe27c3edd7a60f403a/E213S151.bin"
namespace E213S151
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [106, 494], [272], 0)], 0, E213S151.L1),
([(6, true, false, [106, 494], [272], 14)], 0, E213S151.L2),
([(6, true, false, [106, 494], [272], 15)], 0, E213S151.L3),
([(6, true, false, [106, 494], [272], 16)], 0, E213S151.L4),
([(6, true, false, [106, 494], [272], 23)], 0, E213S151.L5),
([(6, true, false, [106, 494], [272], 24)], 0, E213S151.L6),
([(6, true, false, [106, 494], [272], 25)], 0, E213S151.L7),
([(6, true, false, [106, 494], [272], 26)], 0, E213S151.L8),
([(6, true, false, [106, 494], [272], 27)], 0, E213S151.L9),
([(6, true, false, [106, 494], [272], 28)], 0, E213S151.L10),
([(6, true, false, [106, 494], [272], 29)], 0, E213S151.L11),
([(6, true, false, [106, 494], [272], 30)], 0, E213S151.L12),
([(6, true, false, [106, 494], [272], 31)], 0, E213S151.L13),
([(6, true, false, [106, 494], [272], 32)], 0, E213S151.L14),
([(6, true, false, [106, 494], [272], 38)], 0, E213S151.L15),
([(6, true, false, [106, 494], [272], 41)], 0, E213S151.L16),
([(6, true, false, [106, 494], [272], 61)], 0, E213S151.L17),
([(6, true, false, [106, 494], [272], 62)], 0, E213S151.L18),
([(6, true, false, [106, 494], [272], 63)], 0, E213S151.L19),
([(6, true, false, [106, 494], [272], 71)], 0, E213S151.L20),
([(6, true, false, [106, 494], [272], 82)], 0, E213S151.L21),
([(6, true, false, [106, 494], [272], 97)], 0, E213S151.L22),
([(6, true, false, [106, 494], [272], 122)], 0, E213S151.L23),
([(6, true, false, [106, 494], [272], 123)], 0, E213S151.L24),
([(6, true, false, [106, 494], [272], 124)], 0, E213S151.L25),
([(6, true, false, [106, 494], [272], 126)], 0, E213S151.L26),
([(6, true, false, [106, 494], [272], 127)], 0, E213S151.L27),
([(6, true, false, [106, 494], [272], 137)], 0, E213S151.L28),
([(6, true, false, [106, 494], [272], 144)], 0, E213S151.L29)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 29
end E213S151
