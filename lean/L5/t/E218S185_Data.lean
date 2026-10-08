module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S185 "data/lean/90fa031b7b913bba6fc18cfd3be83172/E218S185.bin"
namespace E218S185
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [142, 254, 494], [], 0)], 0, E218S185.L1),
([(0, true, false, [142, 254, 494], [], 1)], 0, E218S185.L2),
([(0, true, false, [142, 254, 494], [], 2)], 0, E218S185.L3),
([(0, true, false, [142, 254, 494], [], 3)], 0, E218S185.L4),
([(0, true, false, [142, 254, 494], [], 4)], 0, E218S185.L5),
([(0, true, false, [142, 254, 494], [], 5)], 0, E218S185.L6),
([(0, true, false, [142, 254, 494], [], 6)], 0, E218S185.L7),
([(0, true, false, [142, 254, 494], [], 7)], 0, E218S185.L8),
([(0, true, false, [142, 254, 494], [], 8)], 0, E218S185.L9),
([(0, true, false, [142, 254, 494], [], 9)], 0, E218S185.L10),
([(0, true, false, [142, 254, 494], [], 10)], 0, E218S185.L11),
([(0, true, false, [142, 254, 494], [], 11)], 0, E218S185.L12),
([(0, true, false, [142, 254, 494], [], 12)], 0, E218S185.L13),
([(0, true, false, [142, 254, 494], [], 13)], 0, E218S185.L14),
([(0, true, false, [142, 254, 494], [], 14)], 0, E218S185.L15),
([(0, true, false, [142, 254, 494], [], 20)], 0, E218S185.L16),
([(0, true, false, [142, 254, 494], [], 21)], 0, E218S185.L17),
([(0, true, false, [142, 254, 494], [], 22)], 0, E218S185.L18),
([(0, true, false, [142, 254, 494], [], 26)], 0, E218S185.L19),
([(0, true, false, [142, 254, 494], [], 30)], 0, E218S185.L20),
([(0, true, false, [142, 254, 494], [], 31)], 0, E218S185.L21),
([(0, true, false, [142, 254, 494], [], 33)], 0, E218S185.L22),
([(0, true, false, [142, 254, 494], [], 34)], 0, E218S185.L23),
([(0, true, false, [142, 254, 494], [], 48)], 0, E218S185.L24),
([(0, true, false, [142, 254, 494], [], 61)], 0, E218S185.L25),
([(0, true, false, [142, 254, 494], [], 62)], 0, E218S185.L26),
([(0, true, false, [142, 254, 494], [], 63)], 0, E218S185.L27),
([(0, true, false, [142, 254, 494], [], 66)], 0, E218S185.L28),
([(0, true, false, [142, 254, 494], [], 69)], 0, E218S185.L29),
([(0, true, false, [142, 254, 494], [], 72)], 0, E218S185.L30),
([(0, true, false, [142, 254, 494], [], 76)], 0, E218S185.L31),
([(0, true, false, [142, 254, 494], [], 83)], 0, E218S185.L32),
([(0, true, false, [142, 254, 494], [], 87)], 0, E218S185.L33),
([(0, true, false, [142, 254, 494], [], 88)], 0, E218S185.L34),
([(0, true, false, [142, 254, 494], [], 91)], 0, E218S185.L35),
([(0, true, false, [142, 254, 494], [], 94)], 0, E218S185.L36),
([(0, true, false, [142, 254, 494], [], 95)], 0, E218S185.L37),
([(0, true, false, [142, 254, 494], [], 102)], 0, E218S185.L38),
([(0, true, false, [142, 254, 494], [], 109)], 0, E218S185.L39),
([(0, true, false, [142, 254, 494], [], 118)], 0, E218S185.L40),
([(0, true, false, [142, 254, 494], [], 131)], 0, E218S185.L41),
([(0, true, false, [142, 254, 494], [], 143)], 0, E218S185.L42),
([(0, true, false, [142, 254, 494], [], 145)], 0, E218S185.L43),
([(0, true, false, [142, 254, 494], [], 150)], 0, E218S185.L44),
([(0, true, false, [142, 254, 494], [], 154)], 0, E218S185.L45),
([(0, true, false, [142, 254, 494], [], 162)], 0, E218S185.L46),
([(0, true, false, [142, 254, 494], [], 187)], 0, E218S185.L47),
([(0, true, false, [142, 254, 494], [], 193)], 0, E218S185.L48),
([(0, true, false, [142, 254, 494], [], 199)], 0, E218S185.L49),
([(0, true, false, [142, 254, 494], [], 212)], 0, E218S185.L50),
([(0, true, false, [142, 254, 494], [], 214)], 0, E218S185.L51),
([(0, true, false, [142, 254, 494], [], 222)], 0, E218S185.L52),
([(0, true, false, [142, 254, 494], [], 259)], 0, E218S185.L53),
([(0, true, false, [142, 254, 494], [], 265)], 0, E218S185.L54)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 54
end E218S185
