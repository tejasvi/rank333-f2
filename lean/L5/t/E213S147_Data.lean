module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S147 "data/lean/f58136199fbf55dfebfd05ff63d792e3/E213S147.bin"
namespace E213S147
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [106, 158, 282], [], 5)], 0, E213S147.L1),
([(7, true, false, [106, 158, 282], [], 6)], 0, E213S147.L2),
([(7, true, false, [106, 158, 282], [], 8)], 0, E213S147.L3),
([(7, true, false, [106, 158, 282], [], 9)], 0, E213S147.L4),
([(7, true, false, [106, 158, 282], [], 10)], 0, E213S147.L5),
([(7, true, false, [106, 158, 282], [], 11)], 0, E213S147.L6),
([(7, true, false, [106, 158, 282], [], 12)], 0, E213S147.L7),
([(7, true, false, [106, 158, 282], [], 14)], 0, E213S147.L8),
([(7, true, false, [106, 158, 282], [], 16)], 0, E213S147.L9),
([(7, true, false, [106, 158, 282], [], 19)], 0, E213S147.L10),
([(7, true, false, [106, 158, 282], [], 32)], 0, E213S147.L11),
([(7, true, false, [106, 158, 282], [], 51)], 0, E213S147.L12),
([(7, true, false, [106, 158, 282], [], 52)], 0, E213S147.L13),
([(7, true, false, [106, 158, 282], [], 53)], 0, E213S147.L14),
([(7, true, false, [106, 158, 282], [], 54)], 0, E213S147.L15),
([(7, true, false, [106, 158, 282], [], 55)], 0, E213S147.L16),
([(7, true, false, [106, 158, 282], [], 56)], 0, E213S147.L17),
([(7, true, false, [106, 158, 282], [], 61)], 0, E213S147.L18),
([(7, true, false, [106, 158, 282], [], 83)], 0, E213S147.L19),
([(7, true, false, [106, 158, 282], [], 84)], 0, E213S147.L20),
([(7, true, false, [106, 158, 282], [], 85)], 0, E213S147.L21),
([(7, true, false, [106, 158, 282], [], 86)], 0, E213S147.L22),
([(7, true, false, [106, 158, 282], [], 87)], 0, E213S147.L23),
([(7, true, false, [106, 158, 282], [], 88)], 0, E213S147.L24),
([(7, true, false, [106, 158, 282], [], 95)], 0, E213S147.L25),
([(7, true, false, [106, 158, 282], [], 115)], 0, E213S147.L26),
([(7, true, false, [106, 158, 282], [], 117)], 0, E213S147.L27),
([(7, true, false, [106, 158, 282], [], 120)], 0, E213S147.L28),
([(7, true, false, [106, 158, 282], [], 123)], 0, E213S147.L29),
([(7, true, false, [106, 158, 282], [], 125)], 0, E213S147.L30),
([(7, true, false, [106, 158, 282], [], 128)], 0, E213S147.L31),
([(7, true, false, [106, 158, 282], [], 131)], 0, E213S147.L32),
([(7, true, false, [106, 158, 282], [], 134)], 0, E213S147.L33),
([(7, true, false, [106, 158, 282], [], 136)], 0, E213S147.L34),
([(7, true, false, [106, 158, 282], [], 139)], 0, E213S147.L35),
([(7, true, false, [106, 158, 282], [], 141)], 0, E213S147.L36),
([(7, true, false, [106, 158, 282], [], 163)], 0, E213S147.L37),
([(7, true, false, [106, 158, 282], [], 165)], 0, E213S147.L38),
([(7, true, false, [106, 158, 282], [], 169)], 0, E213S147.L39),
([(7, true, false, [106, 158, 282], [], 187)], 0, E213S147.L40),
([(7, true, false, [106, 158, 282], [], 193)], 0, E213S147.L41),
([(7, true, false, [106, 158, 282], [], 211)], 0, E213S147.L42),
([(7, true, false, [106, 158, 282], [], 229)], 0, E213S147.L43),
([(7, true, false, [106, 158, 282], [], 265)], 0, E213S147.L44)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 44
end E213S147
