module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S148 "data/lean/94bfdc4b56a9a12c6cf58bfee1d3f901/E236S148.bin"
namespace E236S148
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [372], [232], 4)], 0, E236S148.L1),
([(2, true, false, [372], [232], 5)], 0, E236S148.L2),
([(2, true, false, [372], [232], 6)], 0, E236S148.L3),
([(2, true, false, [372], [232], 7)], 0, E236S148.L4),
([(2, true, false, [372], [232], 10)], 0, E236S148.L5),
([(2, true, false, [372], [232], 74)], 0, E236S148.L6),
([(2, true, false, [372], [232], 75)], 0, E236S148.L7),
([(2, true, false, [372], [232], 76)], 0, E236S148.L8),
([(2, true, false, [372], [232], 77)], 0, E236S148.L9),
([(2, true, false, [372], [232], 81)], 0, E236S148.L10),
([(2, true, false, [372], [232], 82)], 0, E236S148.L11),
([(2, true, false, [372], [232], 83)], 0, E236S148.L12),
([(2, true, false, [372], [232], 85)], 0, E236S148.L13),
([(2, true, false, [372], [232], 86)], 0, E236S148.L14),
([(2, true, false, [372], [232], 91)], 0, E236S148.L15),
([(2, true, false, [372], [232], 112)], 0, E236S148.L16),
([(2, true, false, [372], [232], 113)], 0, E236S148.L17),
([(2, true, false, [372], [232], 114)], 0, E236S148.L18),
([(2, true, false, [372], [232], 115)], 0, E236S148.L19),
([(2, true, false, [372], [232], 116)], 0, E236S148.L20),
([(2, true, false, [372], [232], 117)], 0, E236S148.L21),
([(2, true, false, [372], [232], 118)], 0, E236S148.L22),
([(2, true, false, [372], [232], 119)], 0, E236S148.L23),
([(2, true, false, [372], [232], 120)], 0, E236S148.L24),
([(2, true, false, [372], [232], 121)], 0, E236S148.L25),
([(2, true, false, [372], [232], 122)], 0, E236S148.L26),
([(2, true, false, [372], [232], 123)], 0, E236S148.L27),
([(2, true, false, [372], [232], 166)], 0, E236S148.L28)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 28
end E236S148
