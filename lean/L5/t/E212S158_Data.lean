module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S158 "data/lean/a32bc50de3b1682d92c6350d06053759/E212S158.bin"
namespace E212S158
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [158, 500, 122], [], 1)], 0, E212S158.L1),
([(3, true, false, [158, 500, 122], [], 2)], 0, E212S158.L2),
([(3, true, false, [158, 500, 122], [], 10)], 0, E212S158.L3),
([(3, true, false, [158, 500, 122], [], 13)], 0, E212S158.L4),
([(3, true, false, [158, 500, 122], [], 20)], 0, E212S158.L5),
([(3, true, false, [158, 500, 122], [], 89)], 0, E212S158.L6),
([(3, true, false, [158, 500, 122], [], 90)], 0, E212S158.L7),
([(3, true, false, [158, 500, 122], [], 91)], 0, E212S158.L8),
([(3, true, false, [158, 500, 122], [], 92)], 0, E212S158.L9),
([(3, true, false, [158, 500, 122], [], 93)], 0, E212S158.L10),
([(3, true, false, [158, 500, 122], [], 94)], 0, E212S158.L11),
([(3, true, false, [158, 500, 122], [], 96)], 0, E212S158.L12),
([(3, true, false, [158, 500, 122], [], 97)], 0, E212S158.L13),
([(3, true, false, [158, 500, 122], [], 156)], 0, E212S158.L14),
([(3, true, false, [158, 500, 122], [], 157)], 0, E212S158.L15),
([(3, true, false, [158, 500, 122], [], 158)], 0, E212S158.L16),
([(3, true, false, [158, 500, 122], [], 159)], 0, E212S158.L17),
([(3, true, false, [158, 500, 122], [], 160)], 0, E212S158.L18),
([(3, true, false, [158, 500, 122], [], 161)], 0, E212S158.L19),
([(3, true, false, [158, 500, 122], [], 162)], 0, E212S158.L20),
([(3, true, false, [158, 500, 122], [], 163)], 0, E212S158.L21),
([(3, true, false, [158, 500, 122], [], 164)], 0, E212S158.L22),
([(3, true, false, [158, 500, 122], [], 165)], 0, E212S158.L23),
([(3, true, false, [158, 500, 122], [], 166)], 0, E212S158.L24),
([(3, true, false, [158, 500, 122], [], 167)], 0, E212S158.L25),
([(3, true, false, [158, 500, 122], [], 168)], 0, E212S158.L26),
([(3, true, false, [158, 500, 122], [], 169)], 0, E212S158.L27),
([(3, true, false, [158, 500, 122], [], 170)], 0, E212S158.L28),
([(3, true, false, [158, 500, 122], [], 171)], 0, E212S158.L29),
([(3, true, false, [158, 500, 122], [], 172)], 0, E212S158.L30),
([(3, true, false, [158, 500, 122], [], 173)], 0, E212S158.L31),
([(3, true, false, [158, 500, 122], [], 174)], 0, E212S158.L32),
([(3, true, false, [158, 500, 122], [], 175)], 0, E212S158.L33),
([(3, true, false, [158, 500, 122], [], 176)], 0, E212S158.L34),
([(3, true, false, [158, 500, 122], [], 177)], 0, E212S158.L35),
([(3, true, false, [158, 500, 122], [], 182)], 0, E212S158.L36),
([(3, true, false, [158, 500, 122], [], 183)], 0, E212S158.L37),
([(3, true, false, [158, 500, 122], [], 184)], 0, E212S158.L38),
([(3, true, false, [158, 500, 122], [], 185)], 0, E212S158.L39),
([(3, true, false, [158, 500, 122], [], 191)], 0, E212S158.L40),
([(3, true, false, [158, 500, 122], [], 212)], 0, E212S158.L41),
([(3, true, false, [158, 500, 122], [], 225)], 0, E212S158.L42),
([(3, true, false, [158, 500, 122], [], 234)], 0, E212S158.L43),
([(3, true, false, [158, 500, 122], [], 239)], 0, E212S158.L44),
([(3, true, false, [158, 500, 122], [], 262)], 0, E212S158.L45),
([(3, true, false, [158, 500, 122], [], 276)], 0, E212S158.L46),
([(3, true, false, [158, 500, 122], [], 283)], 0, E212S158.L47),
([(3, true, false, [158, 500, 122], [], 320)], 0, E212S158.L48),
([(3, true, false, [158, 500, 122], [], 326)], 0, E212S158.L49),
([(3, true, false, [158, 500, 122], [], 327)], 0, E212S158.L50),
([(3, true, false, [158, 500, 122], [], 371)], 0, E212S158.L51),
([(3, true, false, [158, 500, 122], [], 415)], 0, E212S158.L52),
([(3, true, false, [158, 500, 122], [], 472)], 0, E212S158.L53),
([(3, true, false, [158, 500, 122], [], 527)], 0, E212S158.L54)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 54
end E212S158
