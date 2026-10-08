module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S79 "data/lean/81cb0771c12fe636a4ccfb0bdbdb31f1/E207S79.bin"
namespace E207S79
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [346, 286], [80, 240], 1)], 0, E207S79.L1),
([(13, true, false, [346, 286], [80, 240], 2)], 0, E207S79.L2),
([(13, true, false, [346, 286], [80, 240], 4)], 0, E207S79.L3),
([(13, true, false, [346, 286], [80, 240], 6)], 0, E207S79.L4),
([(13, true, false, [346, 286], [80, 240], 12)], 0, E207S79.L5),
([(13, true, false, [346, 286], [80, 240], 16)], 0, E207S79.L6),
([(13, true, false, [346, 286], [80, 240], 25)], 0, E207S79.L7),
([(13, true, false, [346, 286], [80, 240], 27)], 0, E207S79.L8),
([(13, true, false, [346, 286], [80, 240], 28)], 0, E207S79.L9),
([(13, true, false, [346, 286], [80, 240], 30)], 0, E207S79.L10),
([(13, true, false, [346, 286], [80, 240], 32)], 0, E207S79.L11),
([(13, true, false, [346, 286], [80, 240], 35)], 0, E207S79.L12),
([(13, true, false, [346, 286], [80, 240], 37)], 0, E207S79.L13),
([(13, true, false, [346, 286], [80, 240], 38)], 0, E207S79.L14),
([(13, true, false, [346, 286], [80, 240], 40)], 0, E207S79.L15),
([(13, true, false, [346, 286], [80, 240], 41)], 0, E207S79.L16),
([(13, true, false, [346, 286], [80, 240], 42)], 0, E207S79.L17),
([(13, true, false, [346, 286], [80, 240], 49)], 0, E207S79.L18),
([(13, true, false, [346, 286], [80, 240], 51)], 0, E207S79.L19),
([(13, true, false, [346, 286], [80, 240], 58)], 0, E207S79.L20),
([(13, true, false, [346, 286], [80, 240], 61)], 0, E207S79.L21),
([(13, true, false, [346, 286], [80, 240], 62)], 0, E207S79.L22),
([(13, true, false, [346, 286], [80, 240], 63)], 0, E207S79.L23),
([(13, true, false, [346, 286], [80, 240], 71)], 0, E207S79.L24),
([(13, true, false, [346, 286], [80, 240], 73)], 0, E207S79.L25),
([(13, true, false, [346, 286], [80, 240], 92)], 0, E207S79.L26),
([(13, true, false, [346, 286], [80, 240], 93)], 0, E207S79.L27),
([(13, true, false, [346, 286], [80, 240], 96)], 0, E207S79.L28),
([(13, true, false, [346, 286], [80, 240], 99)], 0, E207S79.L29),
([(13, true, false, [346, 286], [80, 240], 109)], 0, E207S79.L30),
([(13, true, false, [346, 286], [80, 240], 112)], 0, E207S79.L31),
([(13, true, false, [346, 286], [80, 240], 118)], 0, E207S79.L32),
([(13, true, false, [346, 286], [80, 240], 119)], 0, E207S79.L33),
([(13, true, false, [346, 286], [80, 240], 121)], 0, E207S79.L34),
([(13, true, false, [346, 286], [80, 240], 123)], 0, E207S79.L35),
([(13, true, false, [346, 286], [80, 240], 124)], 0, E207S79.L36),
([(13, true, false, [346, 286], [80, 240], 126)], 0, E207S79.L37),
([(13, true, false, [346, 286], [80, 240], 129)], 0, E207S79.L38),
([(13, true, false, [346, 286], [80, 240], 131)], 0, E207S79.L39),
([(13, true, false, [346, 286], [80, 240], 149)], 0, E207S79.L40),
([(13, true, false, [346, 286], [80, 240], 153)], 0, E207S79.L41)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 41
end E207S79
