module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S79 "data/lean/e1b8f49d5b97bdf2ab55d1c161fe1003/E218S79.bin"
namespace E218S79
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(11, true, false, [494], [272, 352], 0)], 0, E218S79.L1),
([(11, true, false, [494], [272, 352], 1)], 0, E218S79.L2),
([(11, true, false, [494], [272, 352], 2)], 0, E218S79.L3),
([(11, true, false, [494], [272, 352], 4)], 0, E218S79.L4),
([(11, true, false, [494], [272, 352], 5)], 0, E218S79.L5),
([(11, true, false, [494], [272, 352], 6)], 0, E218S79.L6),
([(11, true, false, [494], [272, 352], 7)], 0, E218S79.L7),
([(11, true, false, [494], [272, 352], 9)], 0, E218S79.L8),
([(11, true, false, [494], [272, 352], 18)], 0, E218S79.L9),
([(11, true, false, [494], [272, 352], 19)], 0, E218S79.L10),
([(11, true, false, [494], [272, 352], 24)], 0, E218S79.L11),
([(11, true, false, [494], [272, 352], 27)], 0, E218S79.L12),
([(11, true, false, [494], [272, 352], 34)], 0, E218S79.L13),
([(11, true, false, [494], [272, 352], 39)], 0, E218S79.L14),
([(11, true, false, [494], [272, 352], 46)], 0, E218S79.L15),
([(11, true, false, [494], [272, 352], 47)], 0, E218S79.L16),
([(11, true, false, [494], [272, 352], 48)], 0, E218S79.L17),
([(11, true, false, [494], [272, 352], 49)], 0, E218S79.L18),
([(11, true, false, [494], [272, 352], 50)], 0, E218S79.L19),
([(11, true, false, [494], [272, 352], 53)], 0, E218S79.L20),
([(11, true, false, [494], [272, 352], 54)], 0, E218S79.L21),
([(11, true, false, [494], [272, 352], 56)], 0, E218S79.L22),
([(11, true, false, [494], [272, 352], 57)], 0, E218S79.L23),
([(11, true, false, [494], [272, 352], 59)], 0, E218S79.L24),
([(11, true, false, [494], [272, 352], 61)], 0, E218S79.L25),
([(11, true, false, [494], [272, 352], 62)], 0, E218S79.L26),
([(11, true, false, [494], [272, 352], 64)], 0, E218S79.L27),
([(11, true, false, [494], [272, 352], 65)], 0, E218S79.L28),
([(11, true, false, [494], [272, 352], 66)], 0, E218S79.L29),
([(11, true, false, [494], [272, 352], 67)], 0, E218S79.L30),
([(11, true, false, [494], [272, 352], 72)], 0, E218S79.L31),
([(11, true, false, [494], [272, 352], 75)], 0, E218S79.L32),
([(11, true, false, [494], [272, 352], 81)], 0, E218S79.L33),
([(11, true, false, [494], [272, 352], 82)], 0, E218S79.L34),
([(11, true, false, [494], [272, 352], 85)], 0, E218S79.L35),
([(11, true, false, [494], [272, 352], 86)], 0, E218S79.L36),
([(11, true, false, [494], [272, 352], 88)], 0, E218S79.L37),
([(11, true, false, [494], [272, 352], 91)], 0, E218S79.L38),
([(11, true, false, [494], [272, 352], 92)], 0, E218S79.L39),
([(11, true, false, [494], [272, 352], 93)], 0, E218S79.L40),
([(11, true, false, [494], [272, 352], 94)], 0, E218S79.L41),
([(11, true, false, [494], [272, 352], 95)], 0, E218S79.L42),
([(11, true, false, [494], [272, 352], 96)], 0, E218S79.L43),
([(11, true, false, [494], [272, 352], 97)], 0, E218S79.L44),
([(11, true, false, [494], [272, 352], 98)], 0, E218S79.L45),
([(11, true, false, [494], [272, 352], 99)], 0, E218S79.L46),
([(11, true, false, [494], [272, 352], 100)], 0, E218S79.L47),
([(11, true, false, [494], [272, 352], 101)], 0, E218S79.L48),
([(11, true, false, [494], [272, 352], 102)], 0, E218S79.L49),
([(11, true, false, [494], [272, 352], 103)], 0, E218S79.L50),
([(11, true, false, [494], [272, 352], 104)], 0, E218S79.L51),
([(11, true, false, [494], [272, 352], 105)], 0, E218S79.L52),
([(11, true, false, [494], [272, 352], 112)], 0, E218S79.L53),
([(11, true, false, [494], [272, 352], 113)], 0, E218S79.L54),
([(11, true, false, [494], [272, 352], 121)], 0, E218S79.L55),
([(11, true, false, [494], [272, 352], 126)], 0, E218S79.L56),
([(11, true, false, [494], [272, 352], 156)], 0, E218S79.L57),
([(11, true, false, [494], [272, 352], 157)], 0, E218S79.L58),
([(11, true, false, [494], [272, 352], 162)], 0, E218S79.L59),
([(11, true, false, [494], [272, 352], 163)], 0, E218S79.L60)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 60
end E218S79
