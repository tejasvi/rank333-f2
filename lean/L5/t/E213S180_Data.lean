module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S180 "data/lean/a20a89cde52a4daf27f35628eb248d2a/E213S180.bin"
namespace E213S180
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [254, 282], [96], 3)], 0, E213S180.L1),
([(2, true, false, [254, 282], [96], 9)], 0, E213S180.L2),
([(2, true, false, [254, 282], [96], 20)], 0, E213S180.L3),
([(2, true, false, [254, 282], [96], 29)], 0, E213S180.L4),
([(2, true, false, [254, 282], [96], 30)], 0, E213S180.L5),
([(2, true, false, [254, 282], [96], 31)], 0, E213S180.L6),
([(2, true, false, [254, 282], [96], 32)], 0, E213S180.L7),
([(2, true, false, [254, 282], [96], 33)], 0, E213S180.L8),
([(2, true, false, [254, 282], [96], 34)], 0, E213S180.L9),
([(2, true, false, [254, 282], [96], 35)], 0, E213S180.L10),
([(2, true, false, [254, 282], [96], 36)], 0, E213S180.L11),
([(2, true, false, [254, 282], [96], 37)], 0, E213S180.L12),
([(2, true, false, [254, 282], [96], 38)], 0, E213S180.L13),
([(2, true, false, [254, 282], [96], 40)], 0, E213S180.L14),
([(2, true, false, [254, 282], [96], 43)], 0, E213S180.L15),
([(2, true, false, [254, 282], [96], 49)], 0, E213S180.L16),
([(2, true, false, [254, 282], [96], 57)], 0, E213S180.L17),
([(2, true, false, [254, 282], [96], 60)], 0, E213S180.L18),
([(2, true, false, [254, 282], [96], 61)], 0, E213S180.L19),
([(2, true, false, [254, 282], [96], 79)], 0, E213S180.L20),
([(2, true, false, [254, 282], [96], 83)], 0, E213S180.L21),
([(2, true, false, [254, 282], [96], 109)], 0, E213S180.L22),
([(2, true, false, [254, 282], [96], 110)], 0, E213S180.L23),
([(2, true, false, [254, 282], [96], 111)], 0, E213S180.L24),
([(2, true, false, [254, 282], [96], 117)], 0, E213S180.L25),
([(2, true, false, [254, 282], [96], 124)], 0, E213S180.L26),
([(2, true, false, [254, 282], [96], 127)], 0, E213S180.L27),
([(2, true, false, [254, 282], [96], 138)], 0, E213S180.L28)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 28
end E213S180
