module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S141 "data/lean/d78677a4c6bef2ceb7c7f6811e789fe6/E212S141.bin"
namespace E212S141
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [122, 494], [272], 0)], 0, E212S141.L1),
([(2, true, false, [122, 494], [272], 14)], 0, E212S141.L2),
([(2, true, false, [122, 494], [272], 15)], 0, E212S141.L3),
([(2, true, false, [122, 494], [272], 19)], 0, E212S141.L4),
([(2, true, false, [122, 494], [272], 22)], 0, E212S141.L5),
([(2, true, false, [122, 494], [272], 25)], 11, E212S141.L6),
([(2, true, false, [122, 494], [272], 28)], 0, E212S141.L7),
([(2, true, false, [122, 494], [272], 29)], 0, E212S141.L8),
([(2, true, false, [122, 494], [272], 31)], 0, E212S141.L9),
([(2, true, false, [122, 494], [272], 32)], 0, E212S141.L10),
([(2, true, false, [122, 494], [272], 33)], 0, E212S141.L11),
([(2, true, false, [122, 494], [272], 34)], 0, E212S141.L12),
([(2, true, false, [122, 494], [272], 39)], 0, E212S141.L13),
([(2, true, false, [122, 494], [272], 40)], 0, E212S141.L14),
([(2, true, false, [122, 494], [272], 43)], 0, E212S141.L15),
([(2, true, false, [122, 494], [272], 46)], 0, E212S141.L16),
([(2, true, false, [122, 494], [272], 48)], 0, E212S141.L17),
([(2, true, false, [122, 494], [272], 49)], 0, E212S141.L18),
([(2, true, false, [122, 494], [272], 51)], 0, E212S141.L19),
([(2, true, false, [122, 494], [272], 53)], 0, E212S141.L20),
([(2, true, false, [122, 494], [272], 60)], 0, E212S141.L21),
([(2, true, false, [122, 494], [272], 73)], 0, E212S141.L22),
([(2, true, false, [122, 494], [272], 82)], 0, E212S141.L23),
([(2, true, false, [122, 494], [272], 93)], 0, E212S141.L24),
([(2, true, false, [122, 494], [272], 110)], 0, E212S141.L25),
([(2, true, false, [122, 494], [272], 136)], 0, E212S141.L26),
([(2, true, false, [122, 494], [272], 137)], 0, E212S141.L27),
([(2, true, false, [122, 494], [272], 140)], 0, E212S141.L28),
([(2, true, false, [122, 494], [272], 145)], 0, E212S141.L29),
([(2, true, false, [122, 494], [272], 148)], 0, E212S141.L30),
([(2, true, false, [122, 494], [272], 151)], 0, E212S141.L31),
([(2, true, false, [122, 494], [272], 158)], 0, E212S141.L32),
([(2, true, false, [122, 494], [272], 164)], 0, E212S141.L33),
([(2, true, false, [122, 494], [272], 25), (14, false, false, [500], [272], 24)], 0, E212S141.L34),
([(2, true, false, [122, 494], [272], 25), (14, false, false, [500], [272], 40)], 0, E212S141.L35),
([(2, true, false, [122, 494], [272], 25), (14, false, false, [500], [272], 56)], 0, E212S141.L36),
([(2, true, false, [122, 494], [272], 25), (14, false, false, [500], [272], 72)], 0, E212S141.L37),
([(2, true, false, [122, 494], [272], 25), (14, false, false, [500], [272], 116)], 0, E212S141.L38),
([(2, true, false, [122, 494], [272], 25), (14, false, false, [500], [272], 124)], 0, E212S141.L39),
([(2, true, false, [122, 494], [272], 25), (14, false, false, [500], [272], 132)], 0, E212S141.L40),
([(2, true, false, [122, 494], [272], 25), (14, false, false, [500], [272], 140)], 0, E212S141.L41),
([(2, true, false, [122, 494], [272], 25), (14, false, false, [500], [272], 208)], 0, E212S141.L42),
([(2, true, false, [122, 494], [272], 25), (14, false, false, [500], [272], 224)], 0, E212S141.L43),
([(2, true, false, [122, 494], [272], 25), (14, false, false, [500], [272], 244)], 0, E212S141.L44)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 33
end E212S141
