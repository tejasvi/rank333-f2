module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S50 "data/lean/44ebd49986494094f2450b83e34cf02a/E213S50.bin"
namespace E213S50
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [494], [272, 368], 1)], 0, E213S50.L1),
([(13, true, false, [494], [272, 368], 4)], 0, E213S50.L2),
([(13, true, false, [494], [272, 368], 5)], 0, E213S50.L3),
([(13, true, false, [494], [272, 368], 6)], 0, E213S50.L4),
([(13, true, false, [494], [272, 368], 7)], 0, E213S50.L5),
([(13, true, false, [494], [272, 368], 8)], 0, E213S50.L6),
([(13, true, false, [494], [272, 368], 9)], 0, E213S50.L7),
([(13, true, false, [494], [272, 368], 11)], 0, E213S50.L8),
([(13, true, false, [494], [272, 368], 12)], 0, E213S50.L9),
([(13, true, false, [494], [272, 368], 14)], 0, E213S50.L10),
([(13, true, false, [494], [272, 368], 15)], 0, E213S50.L11),
([(13, true, false, [494], [272, 368], 18)], 0, E213S50.L12),
([(13, true, false, [494], [272, 368], 19)], 0, E213S50.L13),
([(13, true, false, [494], [272, 368], 22)], 0, E213S50.L14),
([(13, true, false, [494], [272, 368], 25)], 0, E213S50.L15),
([(13, true, false, [494], [272, 368], 26)], 0, E213S50.L16),
([(13, true, false, [494], [272, 368], 27)], 0, E213S50.L17),
([(13, true, false, [494], [272, 368], 28)], 0, E213S50.L18),
([(13, true, false, [494], [272, 368], 31)], 0, E213S50.L19),
([(13, true, false, [494], [272, 368], 32)], 0, E213S50.L20),
([(13, true, false, [494], [272, 368], 84)], 0, E213S50.L21),
([(13, true, false, [494], [272, 368], 85)], 0, E213S50.L22),
([(13, true, false, [494], [272, 368], 86)], 0, E213S50.L23),
([(13, true, false, [494], [272, 368], 89)], 0, E213S50.L24),
([(13, true, false, [494], [272, 368], 90)], 0, E213S50.L25),
([(13, true, false, [494], [272, 368], 92)], 0, E213S50.L26),
([(13, true, false, [494], [272, 368], 95)], 0, E213S50.L27),
([(13, true, false, [494], [272, 368], 98)], 0, E213S50.L28),
([(13, true, false, [494], [272, 368], 112)], 0, E213S50.L29),
([(13, true, false, [494], [272, 368], 125)], 0, E213S50.L30),
([(13, true, false, [494], [272, 368], 126)], 0, E213S50.L31),
([(13, true, false, [494], [272, 368], 128)], 0, E213S50.L32),
([(13, true, false, [494], [272, 368], 131)], 0, E213S50.L33),
([(13, true, false, [494], [272, 368], 132)], 0, E213S50.L34),
([(13, true, false, [494], [272, 368], 135)], 0, E213S50.L35),
([(13, true, false, [494], [272, 368], 138)], 0, E213S50.L36),
([(13, true, false, [494], [272, 368], 146)], 0, E213S50.L37)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 37
end E213S50
