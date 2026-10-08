module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S248 "data/lean/da0e00c0e1cf9bfc20921dacf6d039b7/E213S248.bin"
namespace E213S248
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [106, 244, 494], [], 0)], 0, E213S248.L1),
([(4, true, false, [106, 244, 494], [], 3)], 0, E213S248.L2),
([(4, true, false, [106, 244, 494], [], 10)], 0, E213S248.L3),
([(4, true, false, [106, 244, 494], [], 12)], 0, E213S248.L4),
([(4, true, false, [106, 244, 494], [], 19)], 0, E213S248.L5),
([(4, true, false, [106, 244, 494], [], 38)], 0, E213S248.L6),
([(4, true, false, [106, 244, 494], [], 40)], 0, E213S248.L7),
([(4, true, false, [106, 244, 494], [], 41)], 0, E213S248.L8),
([(4, true, false, [106, 244, 494], [], 42)], 0, E213S248.L9),
([(4, true, false, [106, 244, 494], [], 46)], 0, E213S248.L10),
([(4, true, false, [106, 244, 494], [], 49)], 0, E213S248.L11),
([(4, true, false, [106, 244, 494], [], 51)], 0, E213S248.L12),
([(4, true, false, [106, 244, 494], [], 64)], 0, E213S248.L13),
([(4, true, false, [106, 244, 494], [], 66)], 0, E213S248.L14),
([(4, true, false, [106, 244, 494], [], 74)], 0, E213S248.L15),
([(4, true, false, [106, 244, 494], [], 76)], 0, E213S248.L16),
([(4, true, false, [106, 244, 494], [], 83)], 0, E213S248.L17),
([(4, true, false, [106, 244, 494], [], 122)], 0, E213S248.L18),
([(4, true, false, [106, 244, 494], [], 149)], 0, E213S248.L19),
([(4, true, false, [106, 244, 494], [], 150)], 0, E213S248.L20),
([(4, true, false, [106, 244, 494], [], 159)], 0, E213S248.L21),
([(4, true, false, [106, 244, 494], [], 160)], 0, E213S248.L22),
([(4, true, false, [106, 244, 494], [], 166)], 0, E213S248.L23),
([(4, true, false, [106, 244, 494], [], 172)], 0, E213S248.L24),
([(4, true, false, [106, 244, 494], [], 213)], 0, E213S248.L25),
([(4, true, false, [106, 244, 494], [], 221)], 0, E213S248.L26)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 26
end E213S248
