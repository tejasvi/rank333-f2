module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E378S1 "data/lean/aaa34ab4b536b1ed6e96323d27795d85/E378S1.bin"
namespace E378S1
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [501], [17], 1)], 0, E378S1.L1),
([(2, true, false, [501], [17], 3)], 0, E378S1.L2),
([(2, true, false, [501], [17], 5)], 0, E378S1.L3),
([(2, true, false, [501], [17], 21)], 0, E378S1.L4),
([(2, true, false, [501], [17], 24)], 0, E378S1.L5),
([(2, true, false, [501], [17], 34)], 0, E378S1.L6),
([(2, true, false, [501], [17], 40)], 0, E378S1.L7),
([(2, true, false, [501], [17], 41)], 0, E378S1.L8),
([(2, true, false, [501], [17], 42)], 0, E378S1.L9),
([(2, true, false, [501], [17], 43)], 0, E378S1.L10),
([(2, true, false, [501], [17], 44)], 0, E378S1.L11),
([(2, true, false, [501], [17], 47)], 0, E378S1.L12),
([(2, true, false, [501], [17], 50)], 0, E378S1.L13),
([(2, true, false, [501], [17], 51)], 0, E378S1.L14),
([(2, true, false, [501], [17], 61)], 0, E378S1.L15),
([(2, true, false, [501], [17], 69)], 0, E378S1.L16),
([(2, true, false, [501], [17], 72)], 0, E378S1.L17),
([(2, true, false, [501], [17], 80)], 0, E378S1.L18),
([(2, true, false, [501], [17], 152)], 0, E378S1.L19),
([(2, true, false, [501], [17], 153)], 0, E378S1.L20),
([(2, true, false, [501], [17], 155)], 0, E378S1.L21),
([(2, true, false, [501], [17], 171)], 0, E378S1.L22),
([(2, true, false, [501], [17], 225)], 0, E378S1.L23),
([(2, true, false, [501], [17], 228)], 0, E378S1.L24),
([(2, true, false, [501], [17], 231)], 0, E378S1.L25)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 25
end E378S1
