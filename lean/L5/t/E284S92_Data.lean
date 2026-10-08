module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S92 "data/lean/ffb3075cbdaf3c17f3df1b06fbb32a5a/E284S92.bin"
namespace E284S92
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [266, 372], [42], 2)], 0, E284S92.L1),
([(3, true, false, [266, 372], [42], 3)], 0, E284S92.L2),
([(3, true, false, [266, 372], [42], 5)], 0, E284S92.L3),
([(3, true, false, [266, 372], [42], 6)], 0, E284S92.L4),
([(3, true, false, [266, 372], [42], 12)], 0, E284S92.L5),
([(3, true, false, [266, 372], [42], 13)], 0, E284S92.L6),
([(3, true, false, [266, 372], [42], 14)], 0, E284S92.L7),
([(3, true, false, [266, 372], [42], 16)], 0, E284S92.L8),
([(3, true, false, [266, 372], [42], 22)], 0, E284S92.L9),
([(3, true, false, [266, 372], [42], 38)], 0, E284S92.L10),
([(3, true, false, [266, 372], [42], 39)], 0, E284S92.L11),
([(3, true, false, [266, 372], [42], 42)], 0, E284S92.L12),
([(3, true, false, [266, 372], [42], 45)], 0, E284S92.L13),
([(3, true, false, [266, 372], [42], 74)], 0, E284S92.L14),
([(3, true, false, [266, 372], [42], 75)], 0, E284S92.L15),
([(3, true, false, [266, 372], [42], 76)], 0, E284S92.L16)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 16
end E284S92
