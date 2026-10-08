module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S93 "data/lean/a1a4f0616f8de146d240cb78dc2e6035/E212S93.bin"
namespace E212S93
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [254], [272], 1)], 0, E212S93.L1),
([(7, true, false, [254], [272], 5)], 0, E212S93.L2),
([(7, true, false, [254], [272], 6)], 0, E212S93.L3),
([(7, true, false, [254], [272], 17)], 0, E212S93.L4),
([(7, true, false, [254], [272], 25)], 0, E212S93.L5),
([(7, true, false, [254], [272], 26)], 0, E212S93.L6),
([(7, true, false, [254], [272], 27)], 0, E212S93.L7),
([(7, true, false, [254], [272], 29)], 0, E212S93.L8),
([(7, true, false, [254], [272], 33)], 0, E212S93.L9),
([(7, true, false, [254], [272], 34)], 0, E212S93.L10),
([(7, true, false, [254], [272], 44)], 0, E212S93.L11),
([(7, true, false, [254], [272], 50)], 0, E212S93.L12),
([(7, true, false, [254], [272], 62)], 0, E212S93.L13),
([(7, true, false, [254], [272], 63)], 0, E212S93.L14),
([(7, true, false, [254], [272], 64)], 0, E212S93.L15),
([(7, true, false, [254], [272], 65)], 0, E212S93.L16),
([(7, true, false, [254], [272], 67)], 0, E212S93.L17),
([(7, true, false, [254], [272], 71)], 0, E212S93.L18),
([(7, true, false, [254], [272], 72)], 0, E212S93.L19),
([(7, true, false, [254], [272], 83)], 0, E212S93.L20),
([(7, true, false, [254], [272], 91)], 0, E212S93.L21),
([(7, true, false, [254], [272], 100)], 0, E212S93.L22),
([(7, true, false, [254], [272], 101)], 0, E212S93.L23),
([(7, true, false, [254], [272], 102)], 0, E212S93.L24),
([(7, true, false, [254], [272], 103)], 0, E212S93.L25),
([(7, true, false, [254], [272], 108)], 0, E212S93.L26),
([(7, true, false, [254], [272], 118)], 0, E212S93.L27),
([(7, true, false, [254], [272], 124)], 0, E212S93.L28),
([(7, true, false, [254], [272], 170)], 0, E212S93.L29),
([(7, true, false, [254], [272], 194)], 0, E212S93.L30),
([(7, true, false, [254], [272], 204)], 0, E212S93.L31),
([(7, true, false, [254], [272], 207)], 0, E212S93.L32),
([(7, true, false, [254], [272], 208)], 0, E212S93.L33),
([(7, true, false, [254], [272], 210)], 0, E212S93.L34),
([(7, true, false, [254], [272], 216)], 0, E212S93.L35),
([(7, true, false, [254], [272], 217)], 0, E212S93.L36),
([(7, true, false, [254], [272], 218)], 0, E212S93.L37),
([(7, true, false, [254], [272], 219)], 0, E212S93.L38),
([(7, true, false, [254], [272], 220)], 0, E212S93.L39),
([(7, true, false, [254], [272], 222)], 0, E212S93.L40),
([(7, true, false, [254], [272], 223)], 0, E212S93.L41),
([(7, true, false, [254], [272], 224)], 0, E212S93.L42),
([(7, true, false, [254], [272], 225)], 0, E212S93.L43),
([(7, true, false, [254], [272], 226)], 0, E212S93.L44),
([(7, true, false, [254], [272], 227)], 0, E212S93.L45),
([(7, true, false, [254], [272], 228)], 0, E212S93.L46),
([(7, true, false, [254], [272], 229)], 0, E212S93.L47),
([(7, true, false, [254], [272], 230)], 0, E212S93.L48),
([(7, true, false, [254], [272], 231)], 0, E212S93.L49),
([(7, true, false, [254], [272], 233)], 0, E212S93.L50),
([(7, true, false, [254], [272], 236)], 0, E212S93.L51),
([(7, true, false, [254], [272], 245)], 0, E212S93.L52),
([(7, true, false, [254], [272], 248)], 0, E212S93.L53),
([(7, true, false, [254], [272], 264)], 0, E212S93.L54),
([(7, true, false, [254], [272], 268)], 0, E212S93.L55)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 55
end E212S93
