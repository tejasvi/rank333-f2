module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S94 "data/lean/2d76527128f3863df69fec79f6f8bc22/E218S94.bin"
namespace E218S94
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(15, true, false, [494], [272, 352], 0)], 0, E218S94.L1),
([(15, true, false, [494], [272, 352], 1)], 0, E218S94.L2),
([(15, true, false, [494], [272, 352], 2)], 0, E218S94.L3),
([(15, true, false, [494], [272, 352], 3)], 0, E218S94.L4),
([(15, true, false, [494], [272, 352], 4)], 0, E218S94.L5),
([(15, true, false, [494], [272, 352], 5)], 0, E218S94.L6),
([(15, true, false, [494], [272, 352], 6)], 0, E218S94.L7),
([(15, true, false, [494], [272, 352], 7)], 0, E218S94.L8),
([(15, true, false, [494], [272, 352], 8)], 0, E218S94.L9),
([(15, true, false, [494], [272, 352], 9)], 0, E218S94.L10),
([(15, true, false, [494], [272, 352], 10)], 0, E218S94.L11),
([(15, true, false, [494], [272, 352], 11)], 0, E218S94.L12),
([(15, true, false, [494], [272, 352], 13)], 0, E218S94.L13),
([(15, true, false, [494], [272, 352], 16)], 0, E218S94.L14),
([(15, true, false, [494], [272, 352], 18)], 0, E218S94.L15),
([(15, true, false, [494], [272, 352], 19)], 0, E218S94.L16),
([(15, true, false, [494], [272, 352], 27)], 0, E218S94.L17),
([(15, true, false, [494], [272, 352], 28)], 0, E218S94.L18),
([(15, true, false, [494], [272, 352], 34)], 0, E218S94.L19),
([(15, true, false, [494], [272, 352], 39)], 0, E218S94.L20),
([(15, true, false, [494], [272, 352], 47)], 0, E218S94.L21),
([(15, true, false, [494], [272, 352], 48)], 0, E218S94.L22),
([(15, true, false, [494], [272, 352], 50)], 0, E218S94.L23),
([(15, true, false, [494], [272, 352], 53)], 0, E218S94.L24),
([(15, true, false, [494], [272, 352], 54)], 0, E218S94.L25),
([(15, true, false, [494], [272, 352], 57)], 0, E218S94.L26),
([(15, true, false, [494], [272, 352], 59)], 0, E218S94.L27),
([(15, true, false, [494], [272, 352], 61)], 0, E218S94.L28),
([(15, true, false, [494], [272, 352], 62)], 0, E218S94.L29),
([(15, true, false, [494], [272, 352], 80)], 0, E218S94.L30),
([(15, true, false, [494], [272, 352], 81)], 0, E218S94.L31),
([(15, true, false, [494], [272, 352], 82)], 0, E218S94.L32),
([(15, true, false, [494], [272, 352], 85)], 0, E218S94.L33),
([(15, true, false, [494], [272, 352], 86)], 0, E218S94.L34),
([(15, true, false, [494], [272, 352], 88)], 0, E218S94.L35),
([(15, true, false, [494], [272, 352], 91)], 0, E218S94.L36),
([(15, true, false, [494], [272, 352], 106)], 0, E218S94.L37),
([(15, true, false, [494], [272, 352], 108)], 0, E218S94.L38),
([(15, true, false, [494], [272, 352], 126)], 0, E218S94.L39),
([(15, true, false, [494], [272, 352], 162)], 0, E218S94.L40)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 40
end E218S94
