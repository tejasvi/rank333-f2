module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S22 "data/lean/a4e235b51ac05392a6222aede339e201/E207S22.bin"
namespace E207S22
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(15, true, false, [334], [80, 160], 1)], 0, E207S22.L1),
([(15, true, false, [334], [80, 160], 2)], 0, E207S22.L2),
([(15, true, false, [334], [80, 160], 5)], 0, E207S22.L3),
([(15, true, false, [334], [80, 160], 6)], 0, E207S22.L4),
([(15, true, false, [334], [80, 160], 12)], 0, E207S22.L5),
([(15, true, false, [334], [80, 160], 17)], 0, E207S22.L6),
([(15, true, false, [334], [80, 160], 24)], 0, E207S22.L7),
([(15, true, false, [334], [80, 160], 26)], 0, E207S22.L8),
([(15, true, false, [334], [80, 160], 28)], 0, E207S22.L9),
([(15, true, false, [334], [80, 160], 29)], 0, E207S22.L10),
([(15, true, false, [334], [80, 160], 31)], 0, E207S22.L11),
([(15, true, false, [334], [80, 160], 33)], 0, E207S22.L12),
([(15, true, false, [334], [80, 160], 34)], 0, E207S22.L13),
([(15, true, false, [334], [80, 160], 37)], 0, E207S22.L14),
([(15, true, false, [334], [80, 160], 38)], 0, E207S22.L15),
([(15, true, false, [334], [80, 160], 40)], 0, E207S22.L16),
([(15, true, false, [334], [80, 160], 42)], 0, E207S22.L17),
([(15, true, false, [334], [80, 160], 44)], 0, E207S22.L18),
([(15, true, false, [334], [80, 160], 45)], 0, E207S22.L19),
([(15, true, false, [334], [80, 160], 51)], 0, E207S22.L20),
([(15, true, false, [334], [80, 160], 55)], 0, E207S22.L21),
([(15, true, false, [334], [80, 160], 64)], 0, E207S22.L22),
([(15, true, false, [334], [80, 160], 65)], 0, E207S22.L23),
([(15, true, false, [334], [80, 160], 67)], 0, E207S22.L24),
([(15, true, false, [334], [80, 160], 80)], 0, E207S22.L25),
([(15, true, false, [334], [80, 160], 81)], 0, E207S22.L26),
([(15, true, false, [334], [80, 160], 83)], 0, E207S22.L27),
([(15, true, false, [334], [80, 160], 84)], 0, E207S22.L28),
([(15, true, false, [334], [80, 160], 87)], 0, E207S22.L29),
([(15, true, false, [334], [80, 160], 89)], 0, E207S22.L30),
([(15, true, false, [334], [80, 160], 90)], 0, E207S22.L31),
([(15, true, false, [334], [80, 160], 92)], 0, E207S22.L32),
([(15, true, false, [334], [80, 160], 96)], 0, E207S22.L33),
([(15, true, false, [334], [80, 160], 106)], 0, E207S22.L34),
([(15, true, false, [334], [80, 160], 107)], 0, E207S22.L35),
([(15, true, false, [334], [80, 160], 108)], 0, E207S22.L36),
([(15, true, false, [334], [80, 160], 109)], 0, E207S22.L37),
([(15, true, false, [334], [80, 160], 111)], 0, E207S22.L38),
([(15, true, false, [334], [80, 160], 112)], 0, E207S22.L39),
([(15, true, false, [334], [80, 160], 113)], 0, E207S22.L40),
([(15, true, false, [334], [80, 160], 114)], 0, E207S22.L41),
([(15, true, false, [334], [80, 160], 116)], 0, E207S22.L42),
([(15, true, false, [334], [80, 160], 118)], 0, E207S22.L43),
([(15, true, false, [334], [80, 160], 119)], 0, E207S22.L44),
([(15, true, false, [334], [80, 160], 133)], 0, E207S22.L45),
([(15, true, false, [334], [80, 160], 136)], 0, E207S22.L46),
([(15, true, false, [334], [80, 160], 149)], 0, E207S22.L47),
([(15, true, false, [334], [80, 160], 152)], 0, E207S22.L48),
([(15, true, false, [334], [80, 160], 163)], 0, E207S22.L49)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 49
end E207S22
