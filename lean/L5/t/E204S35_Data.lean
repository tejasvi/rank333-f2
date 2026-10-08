module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E204S35 "data/lean/1d53b6fbb601450bf17a0e1d0b5f93eb/E204S35.bin"
namespace E204S35
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [334, 494], [400], 2)], 0, E204S35.L1),
([(0, true, false, [334, 494], [400], 4)], 0, E204S35.L2),
([(0, true, false, [334, 494], [400], 8)], 0, E204S35.L3),
([(0, true, false, [334, 494], [400], 9)], 0, E204S35.L4),
([(0, true, false, [334, 494], [400], 11)], 0, E204S35.L5),
([(0, true, false, [334, 494], [400], 14)], 0, E204S35.L6),
([(0, true, false, [334, 494], [400], 21)], 0, E204S35.L7),
([(0, true, false, [334, 494], [400], 23)], 0, E204S35.L8),
([(0, true, false, [334, 494], [400], 25)], 0, E204S35.L9),
([(0, true, false, [334, 494], [400], 26)], 0, E204S35.L10),
([(0, true, false, [334, 494], [400], 27)], 0, E204S35.L11),
([(0, true, false, [334, 494], [400], 30)], 0, E204S35.L12),
([(0, true, false, [334, 494], [400], 35)], 0, E204S35.L13),
([(0, true, false, [334, 494], [400], 38)], 0, E204S35.L14),
([(0, true, false, [334, 494], [400], 68)], 0, E204S35.L15),
([(0, true, false, [334, 494], [400], 69)], 0, E204S35.L16),
([(0, true, false, [334, 494], [400], 71)], 0, E204S35.L17),
([(0, true, false, [334, 494], [400], 74)], 0, E204S35.L18),
([(0, true, false, [334, 494], [400], 75)], 0, E204S35.L19),
([(0, true, false, [334, 494], [400], 83)], 0, E204S35.L20),
([(0, true, false, [334, 494], [400], 87)], 0, E204S35.L21),
([(0, true, false, [334, 494], [400], 88)], 0, E204S35.L22),
([(0, true, false, [334, 494], [400], 89)], 0, E204S35.L23),
([(0, true, false, [334, 494], [400], 91)], 0, E204S35.L24),
([(0, true, false, [334, 494], [400], 93)], 0, E204S35.L25),
([(0, true, false, [334, 494], [400], 94)], 0, E204S35.L26),
([(0, true, false, [334, 494], [400], 96)], 0, E204S35.L27),
([(0, true, false, [334, 494], [400], 97)], 0, E204S35.L28),
([(0, true, false, [334, 494], [400], 99)], 0, E204S35.L29),
([(0, true, false, [334, 494], [400], 101)], 0, E204S35.L30),
([(0, true, false, [334, 494], [400], 104)], 0, E204S35.L31),
([(0, true, false, [334, 494], [400], 106)], 0, E204S35.L32),
([(0, true, false, [334, 494], [400], 112)], 0, E204S35.L33),
([(0, true, false, [334, 494], [400], 115)], 0, E204S35.L34),
([(0, true, false, [334, 494], [400], 119)], 0, E204S35.L35),
([(0, true, false, [334, 494], [400], 125)], 0, E204S35.L36),
([(0, true, false, [334, 494], [400], 127)], 0, E204S35.L37),
([(0, true, false, [334, 494], [400], 130)], 0, E204S35.L38),
([(0, true, false, [334, 494], [400], 141)], 0, E204S35.L39),
([(0, true, false, [334, 494], [400], 142)], 0, E204S35.L40),
([(0, true, false, [334, 494], [400], 143)], 0, E204S35.L41),
([(0, true, false, [334, 494], [400], 145)], 0, E204S35.L42),
([(0, true, false, [334, 494], [400], 146)], 0, E204S35.L43),
([(0, true, false, [334, 494], [400], 147)], 0, E204S35.L44),
([(0, true, false, [334, 494], [400], 150)], 0, E204S35.L45),
([(0, true, false, [334, 494], [400], 151)], 0, E204S35.L46),
([(0, true, false, [334, 494], [400], 152)], 0, E204S35.L47),
([(0, true, false, [334, 494], [400], 153)], 0, E204S35.L48)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 48
end E204S35
