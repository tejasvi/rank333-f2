module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S278 "data/lean/9c99d704dd005a50eb2eb6a6027cf51a/E213S278.bin"
namespace E213S278
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [254, 282], [10], 1)], 0, E213S278.L1),
([(0, true, false, [254, 282], [10], 2)], 0, E213S278.L2),
([(0, true, false, [254, 282], [10], 4)], 0, E213S278.L3),
([(0, true, false, [254, 282], [10], 10)], 0, E213S278.L4),
([(0, true, false, [254, 282], [10], 20)], 0, E213S278.L5),
([(0, true, false, [254, 282], [10], 21)], 0, E213S278.L6),
([(0, true, false, [254, 282], [10], 22)], 0, E213S278.L7),
([(0, true, false, [254, 282], [10], 23)], 0, E213S278.L8),
([(0, true, false, [254, 282], [10], 24)], 0, E213S278.L9),
([(0, true, false, [254, 282], [10], 25)], 0, E213S278.L10),
([(0, true, false, [254, 282], [10], 27)], 0, E213S278.L11),
([(0, true, false, [254, 282], [10], 28)], 0, E213S278.L12),
([(0, true, false, [254, 282], [10], 29)], 0, E213S278.L13),
([(0, true, false, [254, 282], [10], 44)], 0, E213S278.L14),
([(0, true, false, [254, 282], [10], 53)], 0, E213S278.L15),
([(0, true, false, [254, 282], [10], 101)], 0, E213S278.L16),
([(0, true, false, [254, 282], [10], 103)], 0, E213S278.L17),
([(0, true, false, [254, 282], [10], 109)], 0, E213S278.L18),
([(0, true, false, [254, 282], [10], 110)], 0, E213S278.L19),
([(0, true, false, [254, 282], [10], 128)], 0, E213S278.L20),
([(0, true, false, [254, 282], [10], 134)], 0, E213S278.L21)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 21
end E213S278
