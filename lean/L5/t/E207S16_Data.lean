module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S16 "data/lean/d8e416d4bb476b1c17b54f7f156b99ef/E207S16.bin"
namespace E207S16
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [426], [160, 240], 0)], 0, E207S16.L1),
([(8, true, false, [426], [160, 240], 1)], 0, E207S16.L2),
([(8, true, false, [426], [160, 240], 2)], 0, E207S16.L3),
([(8, true, false, [426], [160, 240], 3)], 0, E207S16.L4),
([(8, true, false, [426], [160, 240], 5)], 0, E207S16.L5),
([(8, true, false, [426], [160, 240], 6)], 0, E207S16.L6),
([(8, true, false, [426], [160, 240], 12)], 0, E207S16.L7),
([(8, true, false, [426], [160, 240], 14)], 0, E207S16.L8),
([(8, true, false, [426], [160, 240], 20)], 0, E207S16.L9),
([(8, true, false, [426], [160, 240], 21)], 0, E207S16.L10),
([(8, true, false, [426], [160, 240], 22)], 0, E207S16.L11),
([(8, true, false, [426], [160, 240], 23)], 0, E207S16.L12),
([(8, true, false, [426], [160, 240], 24)], 0, E207S16.L13),
([(8, true, false, [426], [160, 240], 27)], 0, E207S16.L14),
([(8, true, false, [426], [160, 240], 28)], 0, E207S16.L15),
([(8, true, false, [426], [160, 240], 29)], 0, E207S16.L16),
([(8, true, false, [426], [160, 240], 30)], 0, E207S16.L17),
([(8, true, false, [426], [160, 240], 31)], 0, E207S16.L18),
([(8, true, false, [426], [160, 240], 32)], 0, E207S16.L19),
([(8, true, false, [426], [160, 240], 33)], 0, E207S16.L20),
([(8, true, false, [426], [160, 240], 34)], 0, E207S16.L21),
([(8, true, false, [426], [160, 240], 35)], 0, E207S16.L22),
([(8, true, false, [426], [160, 240], 36)], 0, E207S16.L23),
([(8, true, false, [426], [160, 240], 37)], 0, E207S16.L24),
([(8, true, false, [426], [160, 240], 38)], 0, E207S16.L25),
([(8, true, false, [426], [160, 240], 39)], 0, E207S16.L26),
([(8, true, false, [426], [160, 240], 40)], 0, E207S16.L27),
([(8, true, false, [426], [160, 240], 42)], 0, E207S16.L28),
([(8, true, false, [426], [160, 240], 44)], 0, E207S16.L29),
([(8, true, false, [426], [160, 240], 50)], 0, E207S16.L30),
([(8, true, false, [426], [160, 240], 52)], 0, E207S16.L31),
([(8, true, false, [426], [160, 240], 70)], 0, E207S16.L32),
([(8, true, false, [426], [160, 240], 80)], 0, E207S16.L33),
([(8, true, false, [426], [160, 240], 81)], 0, E207S16.L34),
([(8, true, false, [426], [160, 240], 83)], 0, E207S16.L35),
([(8, true, false, [426], [160, 240], 84)], 0, E207S16.L36),
([(8, true, false, [426], [160, 240], 86)], 0, E207S16.L37),
([(8, true, false, [426], [160, 240], 89)], 0, E207S16.L38),
([(8, true, false, [426], [160, 240], 90)], 0, E207S16.L39),
([(8, true, false, [426], [160, 240], 104)], 0, E207S16.L40),
([(8, true, false, [426], [160, 240], 108)], 0, E207S16.L41),
([(8, true, false, [426], [160, 240], 118)], 0, E207S16.L42),
([(8, true, false, [426], [160, 240], 121)], 0, E207S16.L43),
([(8, true, false, [426], [160, 240], 122)], 0, E207S16.L44),
([(8, true, false, [426], [160, 240], 123)], 0, E207S16.L45),
([(8, true, false, [426], [160, 240], 125)], 0, E207S16.L46),
([(8, true, false, [426], [160, 240], 127)], 0, E207S16.L47),
([(8, true, false, [426], [160, 240], 129)], 0, E207S16.L48),
([(8, true, false, [426], [160, 240], 130)], 0, E207S16.L49),
([(8, true, false, [426], [160, 240], 132)], 0, E207S16.L50),
([(8, true, false, [426], [160, 240], 136)], 0, E207S16.L51),
([(8, true, false, [426], [160, 240], 141)], 0, E207S16.L52),
([(8, true, false, [426], [160, 240], 148)], 0, E207S16.L53),
([(8, true, false, [426], [160, 240], 152)], 0, E207S16.L54)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 54
end E207S16
