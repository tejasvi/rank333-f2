module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S94 "data/lean/22b09a1ba101124eaca82241bba1be15/E236S94.bin"
namespace E236S94
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [354], [258], 4)], 0, E236S94.L1),
([(4, true, false, [354], [258], 5)], 0, E236S94.L2),
([(4, true, false, [354], [258], 6)], 4, E236S94.L3),
([(4, true, false, [354], [258], 7)], 0, E236S94.L4),
([(4, true, false, [354], [258], 8)], 0, E236S94.L5),
([(4, true, false, [354], [258], 9)], 0, E236S94.L6),
([(4, true, false, [354], [258], 10)], 0, E236S94.L7),
([(4, true, false, [354], [258], 11)], 0, E236S94.L8),
([(4, true, false, [354], [258], 14)], 0, E236S94.L9),
([(4, true, false, [354], [258], 15)], 0, E236S94.L10),
([(4, true, false, [354], [258], 16)], 0, E236S94.L11),
([(4, true, false, [354], [258], 17)], 0, E236S94.L12),
([(4, true, false, [354], [258], 18)], 0, E236S94.L13),
([(4, true, false, [354], [258], 19)], 0, E236S94.L14),
([(4, true, false, [354], [258], 21)], 0, E236S94.L15),
([(4, true, false, [354], [258], 22)], 0, E236S94.L16),
([(4, true, false, [354], [258], 23)], 0, E236S94.L17),
([(4, true, false, [354], [258], 43)], 0, E236S94.L18),
([(4, true, false, [354], [258], 55)], 0, E236S94.L19),
([(4, true, false, [354], [258], 78)], 0, E236S94.L20),
([(4, true, false, [354], [258], 80)], 0, E236S94.L21),
([(4, true, false, [354], [258], 81)], 0, E236S94.L22),
([(4, true, false, [354], [258], 83)], 0, E236S94.L23),
([(4, true, false, [354], [258], 84)], 0, E236S94.L24),
([(4, true, false, [354], [258], 86)], 0, E236S94.L25),
([(4, true, false, [354], [258], 87)], 0, E236S94.L26),
([(4, true, false, [354], [258], 88)], 0, E236S94.L27),
([(4, true, false, [354], [258], 89)], 0, E236S94.L28),
([(4, true, false, [354], [258], 90)], 0, E236S94.L29),
([(4, true, false, [354], [258], 92)], 0, E236S94.L30),
([(4, true, false, [354], [258], 98)], 0, E236S94.L31),
([(4, true, false, [354], [258], 117)], 0, E236S94.L32),
([(4, true, false, [354], [258], 118)], 0, E236S94.L33),
([(4, true, false, [354], [258], 128)], 0, E236S94.L34),
([(4, true, false, [354], [258], 130)], 0, E236S94.L35),
([(4, true, false, [354], [258], 136)], 0, E236S94.L36),
([(4, true, false, [354], [258], 142)], 0, E236S94.L37),
([(4, true, false, [354], [258], 146)], 0, E236S94.L38),
([(4, true, false, [354], [258], 186)], 0, E236S94.L39),
([(4, true, false, [354], [258], 191)], 0, E236S94.L40),
([(4, true, false, [354], [258], 206)], 0, E236S94.L41),
([(4, true, false, [354], [258], 6), (13, false, false, [118], [], 161)], 0, E236S94.L42),
([(4, true, false, [354], [258], 6), (13, false, false, [118], [], 193)], 0, E236S94.L43),
([(4, true, false, [354], [258], 6), (13, false, false, [118], [], 209)], 0, E236S94.L44),
([(4, true, false, [354], [258], 6), (13, false, false, [118], [], 225)], 0, E236S94.L45)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 41
end E236S94
