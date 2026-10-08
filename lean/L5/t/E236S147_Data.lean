module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S147 "data/lean/f5f0aae7885de0023908c850c42f42fc/E236S147.bin"
namespace E236S147
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(14, true, false, [354], [96, 232], 1)], 0, E236S147.L1),
([(14, true, false, [354], [96, 232], 2)], 0, E236S147.L2),
([(14, true, false, [354], [96, 232], 5)], 0, E236S147.L3),
([(14, true, false, [354], [96, 232], 6)], 0, E236S147.L4),
([(14, true, false, [354], [96, 232], 20)], 0, E236S147.L5),
([(14, true, false, [354], [96, 232], 21)], 0, E236S147.L6),
([(14, true, false, [354], [96, 232], 22)], 0, E236S147.L7),
([(14, true, false, [354], [96, 232], 23)], 0, E236S147.L8),
([(14, true, false, [354], [96, 232], 24)], 0, E236S147.L9),
([(14, true, false, [354], [96, 232], 26)], 0, E236S147.L10),
([(14, true, false, [354], [96, 232], 32)], 0, E236S147.L11),
([(14, true, false, [354], [96, 232], 34)], 0, E236S147.L12),
([(14, true, false, [354], [96, 232], 44)], 0, E236S147.L13),
([(14, true, false, [354], [96, 232], 45)], 0, E236S147.L14),
([(14, true, false, [354], [96, 232], 48)], 0, E236S147.L15),
([(14, true, false, [354], [96, 232], 49)], 0, E236S147.L16),
([(14, true, false, [354], [96, 232], 52)], 0, E236S147.L17),
([(14, true, false, [354], [96, 232], 53)], 0, E236S147.L18),
([(14, true, false, [354], [96, 232], 54)], 0, E236S147.L19),
([(14, true, false, [354], [96, 232], 56)], 0, E236S147.L20),
([(14, true, false, [354], [96, 232], 58)], 0, E236S147.L21),
([(14, true, false, [354], [96, 232], 61)], 0, E236S147.L22),
([(14, true, false, [354], [96, 232], 63)], 0, E236S147.L23),
([(14, true, false, [354], [96, 232], 119)], 0, E236S147.L24),
([(14, true, false, [354], [96, 232], 121)], 0, E236S147.L25),
([(14, true, false, [354], [96, 232], 122)], 0, E236S147.L26),
([(14, true, false, [354], [96, 232], 124)], 0, E236S147.L27),
([(14, true, false, [354], [96, 232], 127)], 0, E236S147.L28),
([(14, true, false, [354], [96, 232], 128)], 0, E236S147.L29),
([(14, true, false, [354], [96, 232], 131)], 0, E236S147.L30)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 30
end E236S147
