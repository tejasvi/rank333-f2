module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S171 "data/lean/f06a46c9149e9cf325dcf7a5cceb1921/E236S171.bin"
namespace E236S171
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [354], [258], 4)], 0, E236S171.L1),
([(2, true, false, [354], [258], 6)], 0, E236S171.L2),
([(2, true, false, [354], [258], 9)], 0, E236S171.L3),
([(2, true, false, [354], [258], 11)], 0, E236S171.L4),
([(2, true, false, [354], [258], 16)], 0, E236S171.L5),
([(2, true, false, [354], [258], 19)], 0, E236S171.L6),
([(2, true, false, [354], [258], 23)], 0, E236S171.L7),
([(2, true, false, [354], [258], 42)], 0, E236S171.L8),
([(2, true, false, [354], [258], 44)], 0, E236S171.L9),
([(2, true, false, [354], [258], 50)], 0, E236S171.L10),
([(2, true, false, [354], [258], 54)], 0, E236S171.L11),
([(2, true, false, [354], [258], 78)], 0, E236S171.L12),
([(2, true, false, [354], [258], 79)], 0, E236S171.L13),
([(2, true, false, [354], [258], 81)], 0, E236S171.L14),
([(2, true, false, [354], [258], 82)], 0, E236S171.L15),
([(2, true, false, [354], [258], 87)], 0, E236S171.L16),
([(2, true, false, [354], [258], 90)], 0, E236S171.L17),
([(2, true, false, [354], [258], 91)], 0, E236S171.L18),
([(2, true, false, [354], [258], 92)], 0, E236S171.L19),
([(2, true, false, [354], [258], 96)], 0, E236S171.L20),
([(2, true, false, [354], [258], 116)], 0, E236S171.L21),
([(2, true, false, [354], [258], 118)], 0, E236S171.L22),
([(2, true, false, [354], [258], 120)], 0, E236S171.L23),
([(2, true, false, [354], [258], 121)], 0, E236S171.L24),
([(2, true, false, [354], [258], 124)], 0, E236S171.L25),
([(2, true, false, [354], [258], 126)], 0, E236S171.L26),
([(2, true, false, [354], [258], 132)], 0, E236S171.L27),
([(2, true, false, [354], [258], 134)], 0, E236S171.L28),
([(2, true, false, [354], [258], 136)], 0, E236S171.L29),
([(2, true, false, [354], [258], 137)], 0, E236S171.L30),
([(2, true, false, [354], [258], 140)], 0, E236S171.L31),
([(2, true, false, [354], [258], 142)], 0, E236S171.L32),
([(2, true, false, [354], [258], 162)], 0, E236S171.L33),
([(2, true, false, [354], [258], 170)], 0, E236S171.L34),
([(2, true, false, [354], [258], 180)], 0, E236S171.L35),
([(2, true, false, [354], [258], 190)], 0, E236S171.L36),
([(2, true, false, [354], [258], 192)], 0, E236S171.L37),
([(2, true, false, [354], [258], 193)], 0, E236S171.L38),
([(2, true, false, [354], [258], 194)], 0, E236S171.L39)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 39
end E236S171
