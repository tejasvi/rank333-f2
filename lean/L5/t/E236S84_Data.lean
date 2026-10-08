module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S84 "data/lean/de4008139b0cab48b82dd4a9d9115d7b/E236S84.bin"
namespace E236S84
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [354], [96, 118], 2)], 27, E236S84.L1),
([(0, true, false, [354], [96, 118], 49)], 0, E236S84.L2),
([(0, true, false, [354], [96, 118], 57)], 0, E236S84.L3),
([(0, true, false, [354], [96, 118], 58)], 0, E236S84.L4),
([(0, true, false, [354], [96, 118], 2), (1, false, false, [], [96, 118], 8)], 0, E236S84.L5),
([(0, true, false, [354], [96, 118], 2), (1, false, false, [], [96, 118], 72)], 0, E236S84.L6),
([(0, true, false, [354], [96, 118], 2), (1, false, false, [], [96, 118], 192)], 0, E236S84.L7),
([(0, true, false, [354], [96, 118], 2), (1, false, false, [], [96, 118], 208)], 0, E236S84.L8),
([(0, true, false, [354], [96, 118], 2), (1, false, false, [], [96, 118], 264)], 0, E236S84.L9),
([(0, true, false, [354], [96, 118], 2), (1, false, false, [], [96, 118], 320)], 0, E236S84.L10),
([(0, true, false, [354], [96, 118], 2), (1, false, false, [], [96, 118], 556)], 0, E236S84.L11),
([(0, true, false, [354], [96, 118], 2), (1, false, false, [], [96, 118], 560)], 0, E236S84.L12),
([(0, true, false, [354], [96, 118], 2), (1, false, false, [], [96, 118], 569)], 0, E236S84.L13),
([(0, true, false, [354], [96, 118], 2), (1, false, false, [], [96, 118], 572)], 0, E236S84.L14),
([(0, true, false, [354], [96, 118], 2), (1, false, false, [], [96, 118], 662)], 0, E236S84.L15),
([(0, true, false, [354], [96, 118], 2), (1, false, false, [], [96, 118], 666)], 0, E236S84.L16),
([(0, true, false, [354], [96, 118], 2), (1, false, false, [], [96, 118], 675)], 0, E236S84.L17),
([(0, true, false, [354], [96, 118], 2), (1, false, false, [], [96, 118], 678)], 0, E236S84.L18),
([(0, true, false, [354], [96, 118], 2), (1, false, false, [], [96, 118], 773)], 0, E236S84.L19),
([(0, true, false, [354], [96, 118], 2), (1, false, false, [], [96, 118], 776)], 0, E236S84.L20),
([(0, true, false, [354], [96, 118], 2), (1, false, false, [], [96, 118], 778)], 0, E236S84.L21),
([(0, true, false, [354], [96, 118], 2), (1, false, false, [], [96, 118], 788)], 0, E236S84.L22),
([(0, true, false, [354], [96, 118], 2), (1, false, false, [], [96, 118], 879)], 0, E236S84.L23),
([(0, true, false, [354], [96, 118], 2), (1, false, false, [], [96, 118], 882)], 0, E236S84.L24),
([(0, true, false, [354], [96, 118], 2), (1, false, false, [], [96, 118], 884)], 0, E236S84.L25),
([(0, true, false, [354], [96, 118], 2), (1, false, false, [], [96, 118], 894)], 0, E236S84.L26),
([(0, true, false, [354], [96, 118], 2), (1, false, false, [], [96, 118], 980)], 0, E236S84.L27),
([(0, true, false, [354], [96, 118], 2), (1, false, false, [], [96, 118], 996)], 0, E236S84.L28),
([(0, true, false, [354], [96, 118], 2), (1, false, false, [], [96, 118], 1000)], 0, E236S84.L29),
([(0, true, false, [354], [96, 118], 2), (1, false, false, [], [96, 118], 1102)], 0, E236S84.L30),
([(0, true, false, [354], [96, 118], 2), (1, false, false, [], [96, 118], 1106)], 0, E236S84.L31)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E236S84
