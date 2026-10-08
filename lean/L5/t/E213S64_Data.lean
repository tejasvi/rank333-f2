module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S64 "data/lean/19ecd0e88191509773e37c34a8168ddc/E213S64.bin"
namespace E213S64
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [106, 244, 282], [], 0)], 0, E213S64.L1),
([(6, true, false, [106, 244, 282], [], 20)], 0, E213S64.L2),
([(6, true, false, [106, 244, 282], [], 21)], 0, E213S64.L3),
([(6, true, false, [106, 244, 282], [], 24)], 0, E213S64.L4),
([(6, true, false, [106, 244, 282], [], 27)], 0, E213S64.L5),
([(6, true, false, [106, 244, 282], [], 38)], 0, E213S64.L6),
([(6, true, false, [106, 244, 282], [], 39)], 0, E213S64.L7),
([(6, true, false, [106, 244, 282], [], 43)], 0, E213S64.L8),
([(6, true, false, [106, 244, 282], [], 84)], 0, E213S64.L9),
([(6, true, false, [106, 244, 282], [], 85)], 0, E213S64.L10),
([(6, true, false, [106, 244, 282], [], 86)], 0, E213S64.L11),
([(6, true, false, [106, 244, 282], [], 87)], 0, E213S64.L12),
([(6, true, false, [106, 244, 282], [], 88)], 0, E213S64.L13),
([(6, true, false, [106, 244, 282], [], 89)], 0, E213S64.L14),
([(6, true, false, [106, 244, 282], [], 90)], 0, E213S64.L15),
([(6, true, false, [106, 244, 282], [], 91)], 0, E213S64.L16),
([(6, true, false, [106, 244, 282], [], 92)], 0, E213S64.L17),
([(6, true, false, [106, 244, 282], [], 93)], 0, E213S64.L18),
([(6, true, false, [106, 244, 282], [], 100)], 0, E213S64.L19),
([(6, true, false, [106, 244, 282], [], 102)], 0, E213S64.L20),
([(6, true, false, [106, 244, 282], [], 139)], 0, E213S64.L21),
([(6, true, false, [106, 244, 282], [], 143)], 0, E213S64.L22),
([(6, true, false, [106, 244, 282], [], 149)], 0, E213S64.L23),
([(6, true, false, [106, 244, 282], [], 150)], 0, E213S64.L24),
([(6, true, false, [106, 244, 282], [], 152)], 0, E213S64.L25),
([(6, true, false, [106, 244, 282], [], 153)], 0, E213S64.L26),
([(6, true, false, [106, 244, 282], [], 156)], 0, E213S64.L27),
([(6, true, false, [106, 244, 282], [], 166)], 0, E213S64.L28),
([(6, true, false, [106, 244, 282], [], 171)], 0, E213S64.L29),
([(6, true, false, [106, 244, 282], [], 246)], 0, E213S64.L30),
([(6, true, false, [106, 244, 282], [], 247)], 0, E213S64.L31),
([(6, true, false, [106, 244, 282], [], 250)], 0, E213S64.L32),
([(6, true, false, [106, 244, 282], [], 252)], 0, E213S64.L33),
([(6, true, false, [106, 244, 282], [], 254)], 0, E213S64.L34),
([(6, true, false, [106, 244, 282], [], 258)], 0, E213S64.L35),
([(6, true, false, [106, 244, 282], [], 278)], 0, E213S64.L36),
([(6, true, false, [106, 244, 282], [], 282)], 0, E213S64.L37),
([(6, true, false, [106, 244, 282], [], 283)], 0, E213S64.L38),
([(6, true, false, [106, 244, 282], [], 298)], 0, E213S64.L39),
([(6, true, false, [106, 244, 282], [], 302)], 0, E213S64.L40),
([(6, true, false, [106, 244, 282], [], 303)], 0, E213S64.L41),
([(6, true, false, [106, 244, 282], [], 327)], 0, E213S64.L42),
([(6, true, false, [106, 244, 282], [], 335)], 0, E213S64.L43),
([(6, true, false, [106, 244, 282], [], 342)], 0, E213S64.L44),
([(6, true, false, [106, 244, 282], [], 346)], 0, E213S64.L45),
([(6, true, false, [106, 244, 282], [], 369)], 0, E213S64.L46),
([(6, true, false, [106, 244, 282], [], 372)], 0, E213S64.L47),
([(6, true, false, [106, 244, 282], [], 376)], 0, E213S64.L48),
([(6, true, false, [106, 244, 282], [], 426)], 0, E213S64.L49),
([(6, true, false, [106, 244, 282], [], 442)], 0, E213S64.L50),
([(6, true, false, [106, 244, 282], [], 486)], 0, E213S64.L51),
([(6, true, false, [106, 244, 282], [], 487)], 0, E213S64.L52)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 52
end E213S64
