module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S23 "data/lean/7ad4b22c4fb6ec4bc2d933316d2cfb25/E284S23.bin"
namespace E284S23
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [266, 372, 254], [10], 10)], 0, E284S23.L1),
([(3, true, false, [266, 372, 254], [10], 13)], 0, E284S23.L2),
([(3, true, false, [266, 372, 254], [10], 20)], 0, E284S23.L3),
([(3, true, false, [266, 372, 254], [10], 22)], 0, E284S23.L4),
([(3, true, false, [266, 372, 254], [10], 30)], 0, E284S23.L5),
([(3, true, false, [266, 372, 254], [10], 34)], 0, E284S23.L6),
([(3, true, false, [266, 372, 254], [10], 57)], 0, E284S23.L7),
([(3, true, false, [266, 372, 254], [10], 81)], 0, E284S23.L8),
([(3, true, false, [266, 372, 254], [10], 82)], 0, E284S23.L9),
([(3, true, false, [266, 372, 254], [10], 108)], 0, E284S23.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E284S23
