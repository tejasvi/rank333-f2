module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S58 "data/lean/af9ec17ed1bcaa81b8c5ff121bfc6a20/E213S58.bin"
namespace E213S58
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [494, 282], [368], 1)], 0, E213S58.L1),
([(6, true, false, [494, 282], [368], 9)], 0, E213S58.L2),
([(6, true, false, [494, 282], [368], 10)], 0, E213S58.L3),
([(6, true, false, [494, 282], [368], 11)], 0, E213S58.L4),
([(6, true, false, [494, 282], [368], 18)], 0, E213S58.L5),
([(6, true, false, [494, 282], [368], 19)], 0, E213S58.L6),
([(6, true, false, [494, 282], [368], 21)], 0, E213S58.L7),
([(6, true, false, [494, 282], [368], 32)], 0, E213S58.L8),
([(6, true, false, [494, 282], [368], 34)], 0, E213S58.L9),
([(6, true, false, [494, 282], [368], 35)], 0, E213S58.L10),
([(6, true, false, [494, 282], [368], 47)], 0, E213S58.L11),
([(6, true, false, [494, 282], [368], 48)], 0, E213S58.L12),
([(6, true, false, [494, 282], [368], 49)], 0, E213S58.L13),
([(6, true, false, [494, 282], [368], 54)], 0, E213S58.L14),
([(6, true, false, [494, 282], [368], 57)], 0, E213S58.L15),
([(6, true, false, [494, 282], [368], 58)], 0, E213S58.L16),
([(6, true, false, [494, 282], [368], 59)], 0, E213S58.L17),
([(6, true, false, [494, 282], [368], 60)], 0, E213S58.L18),
([(6, true, false, [494, 282], [368], 61)], 0, E213S58.L19),
([(6, true, false, [494, 282], [368], 65)], 0, E213S58.L20),
([(6, true, false, [494, 282], [368], 73)], 0, E213S58.L21),
([(6, true, false, [494, 282], [368], 81)], 0, E213S58.L22),
([(6, true, false, [494, 282], [368], 100)], 0, E213S58.L23),
([(6, true, false, [494, 282], [368], 101)], 0, E213S58.L24),
([(6, true, false, [494, 282], [368], 102)], 0, E213S58.L25),
([(6, true, false, [494, 282], [368], 103)], 0, E213S58.L26),
([(6, true, false, [494, 282], [368], 108)], 0, E213S58.L27),
([(6, true, false, [494, 282], [368], 111)], 0, E213S58.L28),
([(6, true, false, [494, 282], [368], 129)], 0, E213S58.L29),
([(6, true, false, [494, 282], [368], 133)], 0, E213S58.L30),
([(6, true, false, [494, 282], [368], 135)], 0, E213S58.L31),
([(6, true, false, [494, 282], [368], 139)], 0, E213S58.L32),
([(6, true, false, [494, 282], [368], 148)], 0, E213S58.L33),
([(6, true, false, [494, 282], [368], 149)], 0, E213S58.L34),
([(6, true, false, [494, 282], [368], 157)], 0, E213S58.L35),
([(6, true, false, [494, 282], [368], 158)], 0, E213S58.L36),
([(6, true, false, [494, 282], [368], 169)], 0, E213S58.L37),
([(6, true, false, [494, 282], [368], 180)], 0, E213S58.L38),
([(6, true, false, [494, 282], [368], 210)], 0, E213S58.L39),
([(6, true, false, [494, 282], [368], 268)], 0, E213S58.L40),
([(6, true, false, [494, 282], [368], 269)], 0, E213S58.L41),
([(6, true, false, [494, 282], [368], 274)], 0, E213S58.L42),
([(6, true, false, [494, 282], [368], 275)], 0, E213S58.L43)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 43
end E213S58
