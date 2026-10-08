module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S177 "data/lean/f340f75fa038c1218a15ffb18c240176/E236S177.bin"
namespace E236S177
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [354, 372, 394], [96], 0)], 0, E236S177.L1),
([(0, true, false, [354, 372, 394], [96], 2)], 0, E236S177.L2),
([(0, true, false, [354, 372, 394], [96], 15)], 12, E236S177.L3),
([(0, true, false, [354, 372, 394], [96], 19)], 0, E236S177.L4),
([(0, true, false, [354, 372, 394], [96], 21)], 0, E236S177.L5),
([(0, true, false, [354, 372, 394], [96], 25)], 0, E236S177.L6),
([(0, true, false, [354, 372, 394], [96], 28)], 0, E236S177.L7),
([(0, true, false, [354, 372, 394], [96], 29)], 0, E236S177.L8),
([(0, true, false, [354, 372, 394], [96], 40)], 0, E236S177.L9),
([(0, true, false, [354, 372, 394], [96], 54)], 0, E236S177.L10),
([(0, true, false, [354, 372, 394], [96], 60)], 0, E236S177.L11),
([(0, true, false, [354, 372, 394], [96], 68)], 0, E236S177.L12),
([(0, true, false, [354, 372, 394], [96], 79)], 0, E236S177.L13),
([(0, true, false, [354, 372, 394], [96], 80)], 0, E236S177.L14),
([(0, true, false, [354, 372, 394], [96], 15), (1, false, false, [], [96], 112)], 0, E236S177.L15),
([(0, true, false, [354, 372, 394], [96], 15), (1, false, false, [], [96], 120)], 0, E236S177.L16),
([(0, true, false, [354, 372, 394], [96], 15), (1, false, false, [], [96], 128)], 0, E236S177.L17),
([(0, true, false, [354, 372, 394], [96], 15), (1, false, false, [], [96], 136)], 0, E236S177.L18),
([(0, true, false, [354, 372, 394], [96], 15), (1, false, false, [], [96], 152)], 0, E236S177.L19),
([(0, true, false, [354, 372, 394], [96], 15), (1, false, false, [], [96], 160)], 0, E236S177.L20),
([(0, true, false, [354, 372, 394], [96], 15), (1, false, false, [], [96], 272)], 0, E236S177.L21),
([(0, true, false, [354, 372, 394], [96], 15), (1, false, false, [], [96], 280)], 0, E236S177.L22),
([(0, true, false, [354, 372, 394], [96], 15), (1, false, false, [], [96], 284)], 0, E236S177.L23),
([(0, true, false, [354, 372, 394], [96], 15), (1, false, false, [], [96], 320)], 0, E236S177.L24),
([(0, true, false, [354, 372, 394], [96], 15), (1, false, false, [], [96], 416)], 0, E236S177.L25),
([(0, true, false, [354, 372, 394], [96], 15), (1, false, false, [], [96], 440)], 0, E236S177.L26)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 14
end E236S177
