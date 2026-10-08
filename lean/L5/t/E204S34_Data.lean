module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E204S34 "data/lean/9707dcb6fad3125ba315e3b1b2249cc6/E204S34.bin"
namespace E204S34
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [266, 426], [400], 28)], 0, E204S34.L1),
([(0, true, false, [266, 426], [400], 29)], 0, E204S34.L2),
([(0, true, false, [266, 426], [400], 30)], 0, E204S34.L3),
([(0, true, false, [266, 426], [400], 32)], 0, E204S34.L4),
([(0, true, false, [266, 426], [400], 34)], 0, E204S34.L5),
([(0, true, false, [266, 426], [400], 36)], 0, E204S34.L6),
([(0, true, false, [266, 426], [400], 38)], 0, E204S34.L7),
([(0, true, false, [266, 426], [400], 42)], 0, E204S34.L8),
([(0, true, false, [266, 426], [400], 46)], 0, E204S34.L9),
([(0, true, false, [266, 426], [400], 51)], 0, E204S34.L10),
([(0, true, false, [266, 426], [400], 53)], 0, E204S34.L11),
([(0, true, false, [266, 426], [400], 55)], 0, E204S34.L12),
([(0, true, false, [266, 426], [400], 57)], 0, E204S34.L13),
([(0, true, false, [266, 426], [400], 59)], 0, E204S34.L14),
([(0, true, false, [266, 426], [400], 63)], 0, E204S34.L15),
([(0, true, false, [266, 426], [400], 67)], 0, E204S34.L16),
([(0, true, false, [266, 426], [400], 70)], 0, E204S34.L17),
([(0, true, false, [266, 426], [400], 75)], 0, E204S34.L18),
([(0, true, false, [266, 426], [400], 82)], 0, E204S34.L19),
([(0, true, false, [266, 426], [400], 83)], 0, E204S34.L20),
([(0, true, false, [266, 426], [400], 86)], 0, E204S34.L21),
([(0, true, false, [266, 426], [400], 88)], 0, E204S34.L22),
([(0, true, false, [266, 426], [400], 89)], 0, E204S34.L23),
([(0, true, false, [266, 426], [400], 92)], 0, E204S34.L24),
([(0, true, false, [266, 426], [400], 94)], 0, E204S34.L25),
([(0, true, false, [266, 426], [400], 95)], 0, E204S34.L26),
([(0, true, false, [266, 426], [400], 96)], 0, E204S34.L27),
([(0, true, false, [266, 426], [400], 98)], 0, E204S34.L28),
([(0, true, false, [266, 426], [400], 99)], 0, E204S34.L29),
([(0, true, false, [266, 426], [400], 104)], 0, E204S34.L30),
([(0, true, false, [266, 426], [400], 106)], 0, E204S34.L31),
([(0, true, false, [266, 426], [400], 110)], 0, E204S34.L32),
([(0, true, false, [266, 426], [400], 113)], 0, E204S34.L33),
([(0, true, false, [266, 426], [400], 115)], 0, E204S34.L34),
([(0, true, false, [266, 426], [400], 124)], 0, E204S34.L35),
([(0, true, false, [266, 426], [400], 128)], 0, E204S34.L36),
([(0, true, false, [266, 426], [400], 135)], 0, E204S34.L37),
([(0, true, false, [266, 426], [400], 137)], 0, E204S34.L38),
([(0, true, false, [266, 426], [400], 140)], 0, E204S34.L39),
([(0, true, false, [266, 426], [400], 142)], 0, E204S34.L40),
([(0, true, false, [266, 426], [400], 143)], 0, E204S34.L41),
([(0, true, false, [266, 426], [400], 145)], 0, E204S34.L42),
([(0, true, false, [266, 426], [400], 146)], 0, E204S34.L43),
([(0, true, false, [266, 426], [400], 147)], 0, E204S34.L44),
([(0, true, false, [266, 426], [400], 152)], 0, E204S34.L45),
([(0, true, false, [266, 426], [400], 153)], 0, E204S34.L46),
([(0, true, false, [266, 426], [400], 154)], 0, E204S34.L47),
([(0, true, false, [266, 426], [400], 155)], 0, E204S34.L48)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 48
end E204S34
