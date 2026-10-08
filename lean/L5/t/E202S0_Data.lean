module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E202S0 "data/lean/c41e513843da2badc61dedb267802986/E202S0.bin"
namespace E202S0
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(11, true, false, [282], [176], 0)], 62, 0, E202S0.L1),
([(11, true, false, [282], [176], 4)], 62, 0, E202S0.L2),
([(11, true, false, [282], [176], 5)], 62, 0, E202S0.L3),
([(11, true, false, [282], [176], 6)], 62, 0, E202S0.L4),
([(11, true, false, [282], [176], 9)], 62, 0, E202S0.L5),
([(11, true, false, [282], [176], 11)], 62, 0, E202S0.L6),
([(11, true, false, [282], [176], 12)], 62, 0, E202S0.L7),
([(11, true, false, [282], [176], 14)], 62, 0, E202S0.L8),
([(11, true, false, [282], [176], 15)], 62, 0, E202S0.L9),
([(11, true, false, [282], [176], 16)], 62, 0, E202S0.L10),
([(11, true, false, [282], [176], 18)], 62, 0, E202S0.L11),
([(11, true, false, [282], [176], 19)], 62, 0, E202S0.L12),
([(11, true, false, [282], [176], 20)], 62, 0, E202S0.L13),
([(11, true, false, [282], [176], 21)], 62, 0, E202S0.L14),
([(11, true, false, [282], [176], 23)], 62, 0, E202S0.L15),
([(11, true, false, [282], [176], 24)], 62, 0, E202S0.L16),
([(11, true, false, [282], [176], 25)], 62, 0, E202S0.L17),
([(11, true, false, [282], [176], 26)], 62, 0, E202S0.L18),
([(11, true, false, [282], [176], 28)], 62, 0, E202S0.L19),
([(11, true, false, [282], [176], 35)], 62, 0, E202S0.L20),
([(11, true, false, [282], [176], 41)], 62, 0, E202S0.L21),
([(11, true, false, [282], [176], 60)], 62, 0, E202S0.L22),
([(11, true, false, [282], [176], 61)], 62, 0, E202S0.L23),
([(11, true, false, [282], [176], 62)], 62, 0, E202S0.L24),
([(11, true, false, [282], [176], 63)], 62, 0, E202S0.L25),
([(11, true, false, [282], [176], 66)], 62, 0, E202S0.L26),
([(11, true, false, [282], [176], 67)], 62, 0, E202S0.L27),
([(11, true, false, [282], [176], 79)], 62, 0, E202S0.L28),
([(11, true, false, [282], [176], 81)], 62, 0, E202S0.L29),
([(11, true, false, [282], [176], 82)], 62, 0, E202S0.L30),
([(11, true, false, [282], [176], 84)], 62, 0, E202S0.L31),
([(11, true, false, [282], [176], 87)], 62, 0, E202S0.L32),
([(11, true, false, [282], [176], 89)], 62, 0, E202S0.L33),
([(11, true, false, [282], [176], 91)], 62, 0, E202S0.L34),
([(11, true, false, [282], [176], 92)], 62, 0, E202S0.L35),
([(11, true, false, [282], [176], 95)], 62, 0, E202S0.L36),
([(11, true, false, [282], [176], 96)], 62, 0, E202S0.L37),
([(11, true, false, [282], [176], 103)], 62, 0, E202S0.L38),
([(11, true, false, [282], [176], 104)], 62, 0, E202S0.L39),
([(11, true, false, [282], [176], 117)], 62, 0, E202S0.L40),
([(11, true, false, [282], [176], 131)], 62, 0, E202S0.L41),
([(11, true, false, [282], [176], 136)], 62, 0, E202S0.L42),
([(11, true, false, [282], [176], 138)], 62, 0, E202S0.L43),
([(11, true, false, [282], [176], 142)], 62, 0, E202S0.L44),
([(11, true, false, [282], [176], 178)], 62, 0, E202S0.L45),
([(11, true, false, [282], [176], 190)], 62, 0, E202S0.L46),
([(11, true, false, [282], [176], 201)], 62, 0, E202S0.L47),
([(11, true, false, [282], [176], 204)], 62, 0, E202S0.L48),
([(11, true, false, [282], [176], 208)], 62, 0, E202S0.L49),
([(11, true, false, [282], [176], 214)], 62, 0, E202S0.L50),
([(11, true, false, [282], [176], 219)], 62, 0, E202S0.L51),
([(11, true, false, [282], [176], 222)], 62, 0, E202S0.L52),
([(11, true, false, [282], [176], 230)], 62, 0, E202S0.L53),
([(11, true, false, [282], [176], 232)], 62, 0, E202S0.L54),
([(11, true, false, [282], [176], 236)], 62, 0, E202S0.L55),
([(11, true, false, [282], [176], 237)], 62, 0, E202S0.L56),
([(11, true, false, [282], [176], 240)], 62, 0, E202S0.L57),
([(11, true, false, [282], [176], 241)], 62, 0, E202S0.L58),
([(11, true, false, [282], [176], 251)], 62, 0, E202S0.L59),
([(11, true, false, [282], [176], 252)], 62, 0, E202S0.L60),
([(11, true, false, [282], [176], 253)], 62, 0, E202S0.L61),
([(11, true, false, [282], [176], 274)], 62, 0, E202S0.L62)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 62
end E202S0
