module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S67 "data/lean/50fbba6b58179db822dd916849e233ec/E236S67.bin"
namespace E236S67
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [372], [276], 0)], 0, E236S67.L1),
([(7, true, false, [372], [276], 1)], 0, E236S67.L2),
([(7, true, false, [372], [276], 2)], 0, E236S67.L3),
([(7, true, false, [372], [276], 3)], 0, E236S67.L4),
([(7, true, false, [372], [276], 5)], 0, E236S67.L5),
([(7, true, false, [372], [276], 6)], 0, E236S67.L6),
([(7, true, false, [372], [276], 7)], 0, E236S67.L7),
([(7, true, false, [372], [276], 8)], 0, E236S67.L8),
([(7, true, false, [372], [276], 10)], 0, E236S67.L9),
([(7, true, false, [372], [276], 12)], 0, E236S67.L10),
([(7, true, false, [372], [276], 14)], 0, E236S67.L11),
([(7, true, false, [372], [276], 15)], 0, E236S67.L12),
([(7, true, false, [372], [276], 16)], 0, E236S67.L13),
([(7, true, false, [372], [276], 19)], 0, E236S67.L14),
([(7, true, false, [372], [276], 21)], 0, E236S67.L15),
([(7, true, false, [372], [276], 25)], 0, E236S67.L16),
([(7, true, false, [372], [276], 29)], 0, E236S67.L17),
([(7, true, false, [372], [276], 36)], 0, E236S67.L18),
([(7, true, false, [372], [276], 37)], 0, E236S67.L19),
([(7, true, false, [372], [276], 38)], 1, E236S67.L20),
([(7, true, false, [372], [276], 39)], 0, E236S67.L21),
([(7, true, false, [372], [276], 40)], 0, E236S67.L22),
([(7, true, false, [372], [276], 42)], 0, E236S67.L23),
([(7, true, false, [372], [276], 43)], 0, E236S67.L24),
([(7, true, false, [372], [276], 44)], 0, E236S67.L25),
([(7, true, false, [372], [276], 45)], 0, E236S67.L26),
([(7, true, false, [372], [276], 46)], 0, E236S67.L27),
([(7, true, false, [372], [276], 47)], 0, E236S67.L28),
([(7, true, false, [372], [276], 48)], 0, E236S67.L29),
([(7, true, false, [372], [276], 49)], 0, E236S67.L30),
([(7, true, false, [372], [276], 50)], 0, E236S67.L31),
([(7, true, false, [372], [276], 51)], 0, E236S67.L32),
([(7, true, false, [372], [276], 52)], 0, E236S67.L33),
([(7, true, false, [372], [276], 53)], 0, E236S67.L34),
([(7, true, false, [372], [276], 54)], 0, E236S67.L35),
([(7, true, false, [372], [276], 55)], 0, E236S67.L36),
([(7, true, false, [372], [276], 57)], 0, E236S67.L37),
([(7, true, false, [372], [276], 74)], 0, E236S67.L38),
([(7, true, false, [372], [276], 78)], 0, E236S67.L39),
([(7, true, false, [372], [276], 92)], 0, E236S67.L40),
([(7, true, false, [372], [276], 93)], 0, E236S67.L41),
([(7, true, false, [372], [276], 94)], 0, E236S67.L42),
([(7, true, false, [372], [276], 95)], 0, E236S67.L43),
([(7, true, false, [372], [276], 110)], 0, E236S67.L44),
([(7, true, false, [372], [276], 111)], 0, E236S67.L45),
([(7, true, false, [372], [276], 128)], 0, E236S67.L46),
([(7, true, false, [372], [276], 132)], 0, E236S67.L47),
([(7, true, false, [372], [276], 135)], 0, E236S67.L48),
([(7, true, false, [372], [276], 142)], 0, E236S67.L49),
([(7, true, false, [372], [276], 155)], 0, E236S67.L50),
([(7, true, false, [372], [276], 178)], 0, E236S67.L51),
([(7, true, false, [372], [276], 197)], 0, E236S67.L52),
([(7, true, false, [372], [276], 203)], 0, E236S67.L53),
([(7, true, false, [372], [276], 210)], 0, E236S67.L54),
([(7, true, false, [372], [276], 214)], 0, E236S67.L55),
([(7, true, false, [372], [276], 38), (6, false, false, [394], [276, 508], 332)], 0, E236S67.L56)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 55
end E236S67
