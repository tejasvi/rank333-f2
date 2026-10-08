module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S279 "data/lean/d6bfb37abc105d083a77cfd8d958ef8f/E213S279.bin"
namespace E213S279
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [106, 158, 282], [], 0)], 0, E213S279.L1),
([(13, true, false, [106, 158, 282], [], 1)], 0, E213S279.L2),
([(13, true, false, [106, 158, 282], [], 11)], 0, E213S279.L3),
([(13, true, false, [106, 158, 282], [], 13)], 0, E213S279.L4),
([(13, true, false, [106, 158, 282], [], 15)], 0, E213S279.L5),
([(13, true, false, [106, 158, 282], [], 17)], 0, E213S279.L6),
([(13, true, false, [106, 158, 282], [], 19)], 0, E213S279.L7),
([(13, true, false, [106, 158, 282], [], 20)], 0, E213S279.L8),
([(13, true, false, [106, 158, 282], [], 22)], 0, E213S279.L9),
([(13, true, false, [106, 158, 282], [], 23)], 0, E213S279.L10),
([(13, true, false, [106, 158, 282], [], 24)], 0, E213S279.L11),
([(13, true, false, [106, 158, 282], [], 25)], 0, E213S279.L12),
([(13, true, false, [106, 158, 282], [], 26)], 0, E213S279.L13),
([(13, true, false, [106, 158, 282], [], 27)], 0, E213S279.L14),
([(13, true, false, [106, 158, 282], [], 28)], 0, E213S279.L15),
([(13, true, false, [106, 158, 282], [], 29)], 0, E213S279.L16),
([(13, true, false, [106, 158, 282], [], 32)], 0, E213S279.L17),
([(13, true, false, [106, 158, 282], [], 38)], 0, E213S279.L18),
([(13, true, false, [106, 158, 282], [], 40)], 0, E213S279.L19),
([(13, true, false, [106, 158, 282], [], 42)], 0, E213S279.L20),
([(13, true, false, [106, 158, 282], [], 49)], 0, E213S279.L21),
([(13, true, false, [106, 158, 282], [], 51)], 0, E213S279.L22),
([(13, true, false, [106, 158, 282], [], 62)], 0, E213S279.L23),
([(13, true, false, [106, 158, 282], [], 74)], 0, E213S279.L24),
([(13, true, false, [106, 158, 282], [], 76)], 0, E213S279.L25),
([(13, true, false, [106, 158, 282], [], 138)], 0, E213S279.L26),
([(13, true, false, [106, 158, 282], [], 141)], 0, E213S279.L27),
([(13, true, false, [106, 158, 282], [], 148)], 0, E213S279.L28),
([(13, true, false, [106, 158, 282], [], 149)], 0, E213S279.L29),
([(13, true, false, [106, 158, 282], [], 160)], 0, E213S279.L30),
([(13, true, false, [106, 158, 282], [], 162)], 0, E213S279.L31),
([(13, true, false, [106, 158, 282], [], 218)], 0, E213S279.L32),
([(13, true, false, [106, 158, 282], [], 248)], 0, E213S279.L33),
([(13, true, false, [106, 158, 282], [], 250)], 0, E213S279.L34),
([(13, true, false, [106, 158, 282], [], 292)], 0, E213S279.L35),
([(13, true, false, [106, 158, 282], [], 294)], 0, E213S279.L36),
([(13, true, false, [106, 158, 282], [], 336)], 0, E213S279.L37),
([(13, true, false, [106, 158, 282], [], 340)], 0, E213S279.L38),
([(13, true, false, [106, 158, 282], [], 353)], 0, E213S279.L39),
([(13, true, false, [106, 158, 282], [], 396)], 0, E213S279.L40),
([(13, true, false, [106, 158, 282], [], 414)], 0, E213S279.L41)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 41
end E213S279
