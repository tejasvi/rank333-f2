module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E202S5 "data/lean/1fba7b6bc546c7b987f28fe2b06580de/E202S5.bin"
namespace E202S5
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(6, true, false, [426], [176], 0)], 60, 0, E202S5.L1),
([(6, true, false, [426], [176], 1)], 60, 0, E202S5.L2),
([(6, true, false, [426], [176], 2)], 60, 0, E202S5.L3),
([(6, true, false, [426], [176], 3)], 60, 0, E202S5.L4),
([(6, true, false, [426], [176], 4)], 60, 0, E202S5.L5),
([(6, true, false, [426], [176], 5)], 60, 0, E202S5.L6),
([(6, true, false, [426], [176], 6)], 60, 0, E202S5.L7),
([(6, true, false, [426], [176], 7)], 60, 0, E202S5.L8),
([(6, true, false, [426], [176], 8)], 60, 0, E202S5.L9),
([(6, true, false, [426], [176], 9)], 60, 0, E202S5.L10),
([(6, true, false, [426], [176], 10)], 60, 0, E202S5.L11),
([(6, true, false, [426], [176], 11)], 60, 0, E202S5.L12),
([(6, true, false, [426], [176], 12)], 60, 0, E202S5.L13),
([(6, true, false, [426], [176], 14)], 60, 0, E202S5.L14),
([(6, true, false, [426], [176], 15)], 60, 0, E202S5.L15),
([(6, true, false, [426], [176], 16)], 60, 0, E202S5.L16),
([(6, true, false, [426], [176], 17)], 60, 0, E202S5.L17),
([(6, true, false, [426], [176], 18)], 60, 0, E202S5.L18),
([(6, true, false, [426], [176], 19)], 60, 0, E202S5.L19),
([(6, true, false, [426], [176], 20)], 60, 0, E202S5.L20),
([(6, true, false, [426], [176], 21)], 60, 0, E202S5.L21),
([(6, true, false, [426], [176], 22)], 60, 0, E202S5.L22),
([(6, true, false, [426], [176], 24)], 60, 0, E202S5.L23),
([(6, true, false, [426], [176], 26)], 60, 0, E202S5.L24),
([(6, true, false, [426], [176], 27)], 60, 0, E202S5.L25),
([(6, true, false, [426], [176], 28)], 60, 0, E202S5.L26),
([(6, true, false, [426], [176], 29)], 60, 0, E202S5.L27),
([(6, true, false, [426], [176], 39)], 60, 0, E202S5.L28),
([(6, true, false, [426], [176], 40)], 60, 0, E202S5.L29),
([(6, true, false, [426], [176], 61)], 60, 0, E202S5.L30),
([(6, true, false, [426], [176], 71)], 60, 0, E202S5.L31),
([(6, true, false, [426], [176], 79)], 60, 0, E202S5.L32),
([(6, true, false, [426], [176], 80)], 60, 0, E202S5.L33),
([(6, true, false, [426], [176], 83)], 60, 0, E202S5.L34),
([(6, true, false, [426], [176], 84)], 60, 0, E202S5.L35),
([(6, true, false, [426], [176], 87)], 60, 0, E202S5.L36),
([(6, true, false, [426], [176], 88)], 60, 0, E202S5.L37),
([(6, true, false, [426], [176], 91)], 60, 0, E202S5.L38),
([(6, true, false, [426], [176], 92)], 60, 0, E202S5.L39),
([(6, true, false, [426], [176], 95)], 60, 0, E202S5.L40),
([(6, true, false, [426], [176], 96)], 60, 0, E202S5.L41),
([(6, true, false, [426], [176], 98)], 60, 0, E202S5.L42),
([(6, true, false, [426], [176], 103)], 60, 0, E202S5.L43),
([(6, true, false, [426], [176], 104)], 60, 0, E202S5.L44),
([(6, true, false, [426], [176], 105)], 60, 0, E202S5.L45),
([(6, true, false, [426], [176], 116)], 60, 0, E202S5.L46),
([(6, true, false, [426], [176], 120)], 60, 0, E202S5.L47),
([(6, true, false, [426], [176], 128)], 60, 0, E202S5.L48),
([(6, true, false, [426], [176], 143)], 60, 0, E202S5.L49),
([(6, true, false, [426], [176], 153)], 60, 0, E202S5.L50),
([(6, true, false, [426], [176], 205)], 60, 0, E202S5.L51),
([(6, true, false, [426], [176], 218)], 60, 0, E202S5.L52),
([(6, true, false, [426], [176], 219)], 60, 0, E202S5.L53),
([(6, true, false, [426], [176], 231)], 60, 0, E202S5.L54),
([(6, true, false, [426], [176], 232)], 60, 0, E202S5.L55),
([(6, true, false, [426], [176], 237)], 60, 0, E202S5.L56),
([(6, true, false, [426], [176], 251)], 60, 0, E202S5.L57),
([(6, true, false, [426], [176], 254)], 60, 0, E202S5.L58),
([(6, true, false, [426], [176], 255)], 60, 0, E202S5.L59),
([(6, true, false, [426], [176], 269)], 60, 0, E202S5.L60)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 60
end E202S5
