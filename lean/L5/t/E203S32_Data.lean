module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E203S32 "data/lean/755ef747ad9f31278533bc48f2d337bc/E203S32.bin"
namespace E203S32
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [382, 478], [400], 2)], 0, E203S32.L1),
([(0, true, false, [382, 478], [400], 4)], 0, E203S32.L2),
([(0, true, false, [382, 478], [400], 8)], 0, E203S32.L3),
([(0, true, false, [382, 478], [400], 9)], 0, E203S32.L4),
([(0, true, false, [382, 478], [400], 11)], 0, E203S32.L5),
([(0, true, false, [382, 478], [400], 14)], 0, E203S32.L6),
([(0, true, false, [382, 478], [400], 21)], 0, E203S32.L7),
([(0, true, false, [382, 478], [400], 23)], 0, E203S32.L8),
([(0, true, false, [382, 478], [400], 25)], 0, E203S32.L9),
([(0, true, false, [382, 478], [400], 26)], 0, E203S32.L10),
([(0, true, false, [382, 478], [400], 27)], 0, E203S32.L11),
([(0, true, false, [382, 478], [400], 30)], 0, E203S32.L12),
([(0, true, false, [382, 478], [400], 35)], 0, E203S32.L13),
([(0, true, false, [382, 478], [400], 38)], 0, E203S32.L14),
([(0, true, false, [382, 478], [400], 71)], 0, E203S32.L15),
([(0, true, false, [382, 478], [400], 74)], 0, E203S32.L16),
([(0, true, false, [382, 478], [400], 75)], 0, E203S32.L17),
([(0, true, false, [382, 478], [400], 83)], 0, E203S32.L18),
([(0, true, false, [382, 478], [400], 87)], 0, E203S32.L19),
([(0, true, false, [382, 478], [400], 88)], 0, E203S32.L20),
([(0, true, false, [382, 478], [400], 89)], 0, E203S32.L21),
([(0, true, false, [382, 478], [400], 91)], 0, E203S32.L22),
([(0, true, false, [382, 478], [400], 93)], 0, E203S32.L23),
([(0, true, false, [382, 478], [400], 94)], 0, E203S32.L24),
([(0, true, false, [382, 478], [400], 96)], 0, E203S32.L25),
([(0, true, false, [382, 478], [400], 97)], 0, E203S32.L26),
([(0, true, false, [382, 478], [400], 99)], 0, E203S32.L27),
([(0, true, false, [382, 478], [400], 101)], 0, E203S32.L28),
([(0, true, false, [382, 478], [400], 104)], 0, E203S32.L29),
([(0, true, false, [382, 478], [400], 112)], 0, E203S32.L30),
([(0, true, false, [382, 478], [400], 119)], 0, E203S32.L31),
([(0, true, false, [382, 478], [400], 127)], 0, E203S32.L32),
([(0, true, false, [382, 478], [400], 141)], 0, E203S32.L33),
([(0, true, false, [382, 478], [400], 142)], 0, E203S32.L34),
([(0, true, false, [382, 478], [400], 143)], 0, E203S32.L35),
([(0, true, false, [382, 478], [400], 145)], 0, E203S32.L36),
([(0, true, false, [382, 478], [400], 146)], 0, E203S32.L37),
([(0, true, false, [382, 478], [400], 147)], 0, E203S32.L38),
([(0, true, false, [382, 478], [400], 150)], 0, E203S32.L39),
([(0, true, false, [382, 478], [400], 151)], 0, E203S32.L40),
([(0, true, false, [382, 478], [400], 152)], 0, E203S32.L41),
([(0, true, false, [382, 478], [400], 153)], 0, E203S32.L42)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 42
end E203S32
