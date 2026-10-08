module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S44 "data/lean/42898ffae4d68bd6e471572fc29fe588/E207S44.bin"
namespace E207S44
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [494, 346], [68], 2)], 0, E207S44.L1),
([(8, true, false, [494, 346], [68], 3)], 0, E207S44.L2),
([(8, true, false, [494, 346], [68], 5)], 0, E207S44.L3),
([(8, true, false, [494, 346], [68], 6)], 0, E207S44.L4),
([(8, true, false, [494, 346], [68], 8)], 0, E207S44.L5),
([(8, true, false, [494, 346], [68], 9)], 0, E207S44.L6),
([(8, true, false, [494, 346], [68], 16)], 0, E207S44.L7),
([(8, true, false, [494, 346], [68], 20)], 0, E207S44.L8),
([(8, true, false, [494, 346], [68], 21)], 0, E207S44.L9),
([(8, true, false, [494, 346], [68], 22)], 0, E207S44.L10),
([(8, true, false, [494, 346], [68], 23)], 0, E207S44.L11),
([(8, true, false, [494, 346], [68], 30)], 0, E207S44.L12),
([(8, true, false, [494, 346], [68], 31)], 0, E207S44.L13),
([(8, true, false, [494, 346], [68], 32)], 0, E207S44.L14),
([(8, true, false, [494, 346], [68], 42)], 0, E207S44.L15),
([(8, true, false, [494, 346], [68], 54)], 0, E207S44.L16),
([(8, true, false, [494, 346], [68], 62)], 0, E207S44.L17),
([(8, true, false, [494, 346], [68], 64)], 0, E207S44.L18),
([(8, true, false, [494, 346], [68], 66)], 0, E207S44.L19),
([(8, true, false, [494, 346], [68], 70)], 0, E207S44.L20),
([(8, true, false, [494, 346], [68], 72)], 0, E207S44.L21),
([(8, true, false, [494, 346], [68], 74)], 0, E207S44.L22),
([(8, true, false, [494, 346], [68], 76)], 0, E207S44.L23),
([(8, true, false, [494, 346], [68], 82)], 0, E207S44.L24),
([(8, true, false, [494, 346], [68], 84)], 0, E207S44.L25),
([(8, true, false, [494, 346], [68], 88)], 0, E207S44.L26),
([(8, true, false, [494, 346], [68], 98)], 0, E207S44.L27),
([(8, true, false, [494, 346], [68], 101)], 0, E207S44.L28),
([(8, true, false, [494, 346], [68], 104)], 0, E207S44.L29),
([(8, true, false, [494, 346], [68], 106)], 0, E207S44.L30),
([(8, true, false, [494, 346], [68], 109)], 0, E207S44.L31),
([(8, true, false, [494, 346], [68], 124)], 0, E207S44.L32),
([(8, true, false, [494, 346], [68], 137)], 0, E207S44.L33),
([(8, true, false, [494, 346], [68], 142)], 0, E207S44.L34),
([(8, true, false, [494, 346], [68], 146)], 0, E207S44.L35),
([(8, true, false, [494, 346], [68], 147)], 0, E207S44.L36),
([(8, true, false, [494, 346], [68], 156)], 0, E207S44.L37),
([(8, true, false, [494, 346], [68], 161)], 0, E207S44.L38),
([(8, true, false, [494, 346], [68], 170)], 0, E207S44.L39),
([(8, true, false, [494, 346], [68], 174)], 0, E207S44.L40),
([(8, true, false, [494, 346], [68], 175)], 0, E207S44.L41),
([(8, true, false, [494, 346], [68], 176)], 0, E207S44.L42),
([(8, true, false, [494, 346], [68], 177)], 0, E207S44.L43),
([(8, true, false, [494, 346], [68], 182)], 0, E207S44.L44),
([(8, true, false, [494, 346], [68], 206)], 0, E207S44.L45),
([(8, true, false, [494, 346], [68], 208)], 0, E207S44.L46),
([(8, true, false, [494, 346], [68], 223)], 0, E207S44.L47),
([(8, true, false, [494, 346], [68], 260)], 0, E207S44.L48),
([(8, true, false, [494, 346], [68], 265)], 0, E207S44.L49)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 49
end E207S44
