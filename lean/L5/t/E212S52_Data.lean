module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S52 "data/lean/7d2f06e868a34f3a204a866190bf2867/E212S52.bin"
namespace E212S52
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(15, true, false, [494], [272, 368], 1)], 0, E212S52.L1),
([(15, true, false, [494], [272, 368], 4)], 0, E212S52.L2),
([(15, true, false, [494], [272, 368], 5)], 0, E212S52.L3),
([(15, true, false, [494], [272, 368], 6)], 0, E212S52.L4),
([(15, true, false, [494], [272, 368], 7)], 0, E212S52.L5),
([(15, true, false, [494], [272, 368], 8)], 0, E212S52.L6),
([(15, true, false, [494], [272, 368], 9)], 0, E212S52.L7),
([(15, true, false, [494], [272, 368], 11)], 0, E212S52.L8),
([(15, true, false, [494], [272, 368], 18)], 0, E212S52.L9),
([(15, true, false, [494], [272, 368], 19)], 0, E212S52.L10),
([(15, true, false, [494], [272, 368], 31)], 0, E212S52.L11),
([(15, true, false, [494], [272, 368], 32)], 0, E212S52.L12),
([(15, true, false, [494], [272, 368], 40)], 0, E212S52.L13),
([(15, true, false, [494], [272, 368], 41)], 0, E212S52.L14),
([(15, true, false, [494], [272, 368], 69)], 0, E212S52.L15),
([(15, true, false, [494], [272, 368], 76)], 0, E212S52.L16),
([(15, true, false, [494], [272, 368], 79)], 0, E212S52.L17),
([(15, true, false, [494], [272, 368], 86)], 0, E212S52.L18),
([(15, true, false, [494], [272, 368], 89)], 0, E212S52.L19),
([(15, true, false, [494], [272, 368], 90)], 0, E212S52.L20),
([(15, true, false, [494], [272, 368], 92)], 0, E212S52.L21),
([(15, true, false, [494], [272, 368], 95)], 0, E212S52.L22),
([(15, true, false, [494], [272, 368], 96)], 0, E212S52.L23),
([(15, true, false, [494], [272, 368], 97)], 0, E212S52.L24),
([(15, true, false, [494], [272, 368], 102)], 0, E212S52.L25),
([(15, true, false, [494], [272, 368], 103)], 0, E212S52.L26),
([(15, true, false, [494], [272, 368], 104)], 0, E212S52.L27),
([(15, true, false, [494], [272, 368], 108)], 0, E212S52.L28),
([(15, true, false, [494], [272, 368], 116)], 0, E212S52.L29),
([(15, true, false, [494], [272, 368], 117)], 0, E212S52.L30),
([(15, true, false, [494], [272, 368], 125)], 0, E212S52.L31),
([(15, true, false, [494], [272, 368], 126)], 0, E212S52.L32),
([(15, true, false, [494], [272, 368], 128)], 0, E212S52.L33),
([(15, true, false, [494], [272, 368], 130)], 0, E212S52.L34),
([(15, true, false, [494], [272, 368], 131)], 0, E212S52.L35),
([(15, true, false, [494], [272, 368], 132)], 0, E212S52.L36),
([(15, true, false, [494], [272, 368], 135)], 0, E212S52.L37),
([(15, true, false, [494], [272, 368], 160)], 0, E212S52.L38),
([(15, true, false, [494], [272, 368], 161)], 0, E212S52.L39),
([(15, true, false, [494], [272, 368], 167)], 0, E212S52.L40)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 40
end E212S52
