module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S333 "data/lean/90421edbbbc1b83dc8e925734c9cf31e/E236S333.bin"
namespace E236S333
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [158, 354], [276], 5)], 0, E236S333.L1),
([(2, true, false, [158, 354], [276], 9)], 0, E236S333.L2),
([(2, true, false, [158, 354], [276], 18)], 0, E236S333.L3),
([(2, true, false, [158, 354], [276], 42)], 0, E236S333.L4),
([(2, true, false, [158, 354], [276], 47)], 0, E236S333.L5),
([(2, true, false, [158, 354], [276], 52)], 0, E236S333.L6),
([(2, true, false, [158, 354], [276], 55)], 0, E236S333.L7),
([(2, true, false, [158, 354], [276], 59)], 0, E236S333.L8),
([(2, true, false, [158, 354], [276], 73)], 0, E236S333.L9),
([(2, true, false, [158, 354], [276], 78)], 0, E236S333.L10),
([(2, true, false, [158, 354], [276], 79)], 0, E236S333.L11),
([(2, true, false, [158, 354], [276], 80)], 0, E236S333.L12),
([(2, true, false, [158, 354], [276], 82)], 0, E236S333.L13),
([(2, true, false, [158, 354], [276], 99)], 0, E236S333.L14),
([(2, true, false, [158, 354], [276], 101)], 0, E236S333.L15),
([(2, true, false, [158, 354], [276], 125)], 0, E236S333.L16),
([(2, true, false, [158, 354], [276], 133)], 0, E236S333.L17)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 17
end E236S333
