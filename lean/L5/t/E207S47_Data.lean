module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S47 "data/lean/326a32bcf95c38a9430872090ada884e/E207S47.bin"
namespace E207S47
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(12, true, false, [494, 286], [68], 2)], 0, E207S47.L1),
([(12, true, false, [494, 286], [68], 3)], 0, E207S47.L2),
([(12, true, false, [494, 286], [68], 5)], 0, E207S47.L3),
([(12, true, false, [494, 286], [68], 6)], 0, E207S47.L4),
([(12, true, false, [494, 286], [68], 15)], 0, E207S47.L5),
([(12, true, false, [494, 286], [68], 20)], 0, E207S47.L6),
([(12, true, false, [494, 286], [68], 23)], 0, E207S47.L7),
([(12, true, false, [494, 286], [68], 24)], 0, E207S47.L8),
([(12, true, false, [494, 286], [68], 31)], 0, E207S47.L9),
([(12, true, false, [494, 286], [68], 42)], 0, E207S47.L10),
([(12, true, false, [494, 286], [68], 43)], 0, E207S47.L11),
([(12, true, false, [494, 286], [68], 44)], 0, E207S47.L12),
([(12, true, false, [494, 286], [68], 45)], 0, E207S47.L13),
([(12, true, false, [494, 286], [68], 47)], 0, E207S47.L14),
([(12, true, false, [494, 286], [68], 48)], 0, E207S47.L15),
([(12, true, false, [494, 286], [68], 50)], 0, E207S47.L16),
([(12, true, false, [494, 286], [68], 51)], 0, E207S47.L17),
([(12, true, false, [494, 286], [68], 53)], 0, E207S47.L18),
([(12, true, false, [494, 286], [68], 54)], 0, E207S47.L19),
([(12, true, false, [494, 286], [68], 57)], 0, E207S47.L20),
([(12, true, false, [494, 286], [68], 58)], 0, E207S47.L21),
([(12, true, false, [494, 286], [68], 64)], 0, E207S47.L22),
([(12, true, false, [494, 286], [68], 65)], 0, E207S47.L23),
([(12, true, false, [494, 286], [68], 68)], 0, E207S47.L24),
([(12, true, false, [494, 286], [68], 70)], 0, E207S47.L25),
([(12, true, false, [494, 286], [68], 73)], 0, E207S47.L26),
([(12, true, false, [494, 286], [68], 82)], 0, E207S47.L27),
([(12, true, false, [494, 286], [68], 84)], 0, E207S47.L28),
([(12, true, false, [494, 286], [68], 85)], 0, E207S47.L29),
([(12, true, false, [494, 286], [68], 88)], 0, E207S47.L30),
([(12, true, false, [494, 286], [68], 98)], 0, E207S47.L31),
([(12, true, false, [494, 286], [68], 104)], 0, E207S47.L32),
([(12, true, false, [494, 286], [68], 106)], 0, E207S47.L33),
([(12, true, false, [494, 286], [68], 109)], 0, E207S47.L34),
([(12, true, false, [494, 286], [68], 113)], 0, E207S47.L35),
([(12, true, false, [494, 286], [68], 124)], 0, E207S47.L36),
([(12, true, false, [494, 286], [68], 150)], 0, E207S47.L37),
([(12, true, false, [494, 286], [68], 156)], 0, E207S47.L38),
([(12, true, false, [494, 286], [68], 174)], 0, E207S47.L39),
([(12, true, false, [494, 286], [68], 176)], 0, E207S47.L40),
([(12, true, false, [494, 286], [68], 183)], 0, E207S47.L41),
([(12, true, false, [494, 286], [68], 192)], 0, E207S47.L42),
([(12, true, false, [494, 286], [68], 193)], 0, E207S47.L43),
([(12, true, false, [494, 286], [68], 206)], 0, E207S47.L44),
([(12, true, false, [494, 286], [68], 208)], 0, E207S47.L45),
([(12, true, false, [494, 286], [68], 211)], 0, E207S47.L46),
([(12, true, false, [494, 286], [68], 218)], 0, E207S47.L47),
([(12, true, false, [494, 286], [68], 219)], 0, E207S47.L48),
([(12, true, false, [494, 286], [68], 223)], 0, E207S47.L49),
([(12, true, false, [494, 286], [68], 244)], 0, E207S47.L50),
([(12, true, false, [494, 286], [68], 245)], 0, E207S47.L51),
([(12, true, false, [494, 286], [68], 260)], 0, E207S47.L52),
([(12, true, false, [494, 286], [68], 265)], 0, E207S47.L53)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 53
end E207S47
