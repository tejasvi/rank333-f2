module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S156 "data/lean/f9cd3ed4ea1975ce1ce8efbfd5a97882/E218S156.bin"
namespace E218S156
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [106, 494], [272], 0)], 0, E218S156.L1),
([(2, true, false, [106, 494], [272], 1)], 0, E218S156.L2),
([(2, true, false, [106, 494], [272], 14)], 0, E218S156.L3),
([(2, true, false, [106, 494], [272], 15)], 0, E218S156.L4),
([(2, true, false, [106, 494], [272], 16)], 0, E218S156.L5),
([(2, true, false, [106, 494], [272], 18)], 0, E218S156.L6),
([(2, true, false, [106, 494], [272], 19)], 0, E218S156.L7),
([(2, true, false, [106, 494], [272], 22)], 0, E218S156.L8),
([(2, true, false, [106, 494], [272], 24)], 0, E218S156.L9),
([(2, true, false, [106, 494], [272], 27)], 0, E218S156.L10),
([(2, true, false, [106, 494], [272], 28)], 0, E218S156.L11),
([(2, true, false, [106, 494], [272], 31)], 0, E218S156.L12),
([(2, true, false, [106, 494], [272], 33)], 0, E218S156.L13),
([(2, true, false, [106, 494], [272], 36)], 0, E218S156.L14),
([(2, true, false, [106, 494], [272], 38)], 0, E218S156.L15),
([(2, true, false, [106, 494], [272], 39)], 0, E218S156.L16),
([(2, true, false, [106, 494], [272], 41)], 0, E218S156.L17),
([(2, true, false, [106, 494], [272], 42)], 0, E218S156.L18),
([(2, true, false, [106, 494], [272], 43)], 0, E218S156.L19),
([(2, true, false, [106, 494], [272], 45)], 0, E218S156.L20),
([(2, true, false, [106, 494], [272], 47)], 0, E218S156.L21),
([(2, true, false, [106, 494], [272], 50)], 0, E218S156.L22),
([(2, true, false, [106, 494], [272], 51)], 0, E218S156.L23),
([(2, true, false, [106, 494], [272], 52)], 0, E218S156.L24),
([(2, true, false, [106, 494], [272], 53)], 0, E218S156.L25),
([(2, true, false, [106, 494], [272], 54)], 0, E218S156.L26),
([(2, true, false, [106, 494], [272], 55)], 0, E218S156.L27),
([(2, true, false, [106, 494], [272], 56)], 0, E218S156.L28),
([(2, true, false, [106, 494], [272], 57)], 0, E218S156.L29),
([(2, true, false, [106, 494], [272], 58)], 0, E218S156.L30),
([(2, true, false, [106, 494], [272], 59)], 0, E218S156.L31),
([(2, true, false, [106, 494], [272], 60)], 0, E218S156.L32),
([(2, true, false, [106, 494], [272], 61)], 0, E218S156.L33),
([(2, true, false, [106, 494], [272], 62)], 0, E218S156.L34),
([(2, true, false, [106, 494], [272], 71)], 0, E218S156.L35),
([(2, true, false, [106, 494], [272], 82)], 0, E218S156.L36),
([(2, true, false, [106, 494], [272], 97)], 0, E218S156.L37),
([(2, true, false, [106, 494], [272], 114)], 0, E218S156.L38),
([(2, true, false, [106, 494], [272], 117)], 0, E218S156.L39),
([(2, true, false, [106, 494], [272], 120)], 0, E218S156.L40),
([(2, true, false, [106, 494], [272], 122)], 0, E218S156.L41),
([(2, true, false, [106, 494], [272], 124)], 0, E218S156.L42),
([(2, true, false, [106, 494], [272], 129)], 0, E218S156.L43),
([(2, true, false, [106, 494], [272], 135)], 0, E218S156.L44),
([(2, true, false, [106, 494], [272], 137)], 0, E218S156.L45),
([(2, true, false, [106, 494], [272], 139)], 0, E218S156.L46),
([(2, true, false, [106, 494], [272], 140)], 0, E218S156.L47),
([(2, true, false, [106, 494], [272], 144)], 0, E218S156.L48)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 48
end E218S156
