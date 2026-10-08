module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S91 "data/lean/f36ea308f02dc4f317a37fd1bb8b26db/E218S91.bin"
namespace E218S91
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [266, 500], [352], 0)], 0, E218S91.L1),
([(8, true, false, [266, 500], [352], 3)], 0, E218S91.L2),
([(8, true, false, [266, 500], [352], 4)], 0, E218S91.L3),
([(8, true, false, [266, 500], [352], 6)], 0, E218S91.L4),
([(8, true, false, [266, 500], [352], 7)], 0, E218S91.L5),
([(8, true, false, [266, 500], [352], 9)], 0, E218S91.L6),
([(8, true, false, [266, 500], [352], 10)], 0, E218S91.L7),
([(8, true, false, [266, 500], [352], 11)], 0, E218S91.L8),
([(8, true, false, [266, 500], [352], 12)], 0, E218S91.L9),
([(8, true, false, [266, 500], [352], 14)], 0, E218S91.L10),
([(8, true, false, [266, 500], [352], 16)], 0, E218S91.L11),
([(8, true, false, [266, 500], [352], 17)], 0, E218S91.L12),
([(8, true, false, [266, 500], [352], 18)], 0, E218S91.L13),
([(8, true, false, [266, 500], [352], 19)], 0, E218S91.L14),
([(8, true, false, [266, 500], [352], 20)], 0, E218S91.L15),
([(8, true, false, [266, 500], [352], 22)], 0, E218S91.L16),
([(8, true, false, [266, 500], [352], 24)], 0, E218S91.L17),
([(8, true, false, [266, 500], [352], 25)], 0, E218S91.L18),
([(8, true, false, [266, 500], [352], 27)], 0, E218S91.L19),
([(8, true, false, [266, 500], [352], 30)], 0, E218S91.L20),
([(8, true, false, [266, 500], [352], 33)], 0, E218S91.L21),
([(8, true, false, [266, 500], [352], 34)], 0, E218S91.L22),
([(8, true, false, [266, 500], [352], 35)], 0, E218S91.L23),
([(8, true, false, [266, 500], [352], 37)], 0, E218S91.L24),
([(8, true, false, [266, 500], [352], 38)], 0, E218S91.L25),
([(8, true, false, [266, 500], [352], 41)], 0, E218S91.L26),
([(8, true, false, [266, 500], [352], 43)], 0, E218S91.L27),
([(8, true, false, [266, 500], [352], 45)], 0, E218S91.L28),
([(8, true, false, [266, 500], [352], 46)], 0, E218S91.L29),
([(8, true, false, [266, 500], [352], 53)], 0, E218S91.L30),
([(8, true, false, [266, 500], [352], 58)], 0, E218S91.L31),
([(8, true, false, [266, 500], [352], 61)], 0, E218S91.L32),
([(8, true, false, [266, 500], [352], 64)], 0, E218S91.L33),
([(8, true, false, [266, 500], [352], 78)], 0, E218S91.L34),
([(8, true, false, [266, 500], [352], 84)], 0, E218S91.L35),
([(8, true, false, [266, 500], [352], 90)], 0, E218S91.L36),
([(8, true, false, [266, 500], [352], 92)], 0, E218S91.L37),
([(8, true, false, [266, 500], [352], 102)], 0, E218S91.L38),
([(8, true, false, [266, 500], [352], 112)], 0, E218S91.L39),
([(8, true, false, [266, 500], [352], 130)], 0, E218S91.L40),
([(8, true, false, [266, 500], [352], 136)], 0, E218S91.L41),
([(8, true, false, [266, 500], [352], 152)], 0, E218S91.L42),
([(8, true, false, [266, 500], [352], 164)], 0, E218S91.L43),
([(8, true, false, [266, 500], [352], 165)], 0, E218S91.L44),
([(8, true, false, [266, 500], [352], 166)], 0, E218S91.L45),
([(8, true, false, [266, 500], [352], 172)], 0, E218S91.L46),
([(8, true, false, [266, 500], [352], 174)], 0, E218S91.L47),
([(8, true, false, [266, 500], [352], 187)], 0, E218S91.L48),
([(8, true, false, [266, 500], [352], 188)], 0, E218S91.L49),
([(8, true, false, [266, 500], [352], 190)], 0, E218S91.L50),
([(8, true, false, [266, 500], [352], 193)], 0, E218S91.L51),
([(8, true, false, [266, 500], [352], 195)], 0, E218S91.L52),
([(8, true, false, [266, 500], [352], 229)], 0, E218S91.L53),
([(8, true, false, [266, 500], [352], 246)], 0, E218S91.L54)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 54
end E218S91
