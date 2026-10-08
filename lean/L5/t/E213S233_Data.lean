module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S233 "data/lean/dc897eaa549bbb50bcefc1c630b256c3/E213S233.bin"
namespace E213S233
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [158, 282, 254], [], 20)], 0, E213S233.L1),
([(6, true, false, [158, 282, 254], [], 22)], 0, E213S233.L2),
([(6, true, false, [158, 282, 254], [], 28)], 0, E213S233.L3),
([(6, true, false, [158, 282, 254], [], 32)], 0, E213S233.L4),
([(6, true, false, [158, 282, 254], [], 53)], 0, E213S233.L5),
([(6, true, false, [158, 282, 254], [], 88)], 0, E213S233.L6),
([(6, true, false, [158, 282, 254], [], 89)], 0, E213S233.L7),
([(6, true, false, [158, 282, 254], [], 90)], 0, E213S233.L8),
([(6, true, false, [158, 282, 254], [], 91)], 0, E213S233.L9),
([(6, true, false, [158, 282, 254], [], 92)], 0, E213S233.L10),
([(6, true, false, [158, 282, 254], [], 93)], 0, E213S233.L11),
([(6, true, false, [158, 282, 254], [], 94)], 0, E213S233.L12),
([(6, true, false, [158, 282, 254], [], 95)], 0, E213S233.L13),
([(6, true, false, [158, 282, 254], [], 96)], 0, E213S233.L14),
([(6, true, false, [158, 282, 254], [], 97)], 0, E213S233.L15),
([(6, true, false, [158, 282, 254], [], 99)], 0, E213S233.L16),
([(6, true, false, [158, 282, 254], [], 108)], 0, E213S233.L17),
([(6, true, false, [158, 282, 254], [], 109)], 0, E213S233.L18),
([(6, true, false, [158, 282, 254], [], 113)], 0, E213S233.L19),
([(6, true, false, [158, 282, 254], [], 153)], 0, E213S233.L20),
([(6, true, false, [158, 282, 254], [], 157)], 0, E213S233.L21),
([(6, true, false, [158, 282, 254], [], 162)], 0, E213S233.L22),
([(6, true, false, [158, 282, 254], [], 163)], 0, E213S233.L23),
([(6, true, false, [158, 282, 254], [], 166)], 0, E213S233.L24),
([(6, true, false, [158, 282, 254], [], 168)], 0, E213S233.L25),
([(6, true, false, [158, 282, 254], [], 180)], 0, E213S233.L26),
([(6, true, false, [158, 282, 254], [], 216)], 0, E213S233.L27),
([(6, true, false, [158, 282, 254], [], 217)], 0, E213S233.L28),
([(6, true, false, [158, 282, 254], [], 220)], 0, E213S233.L29),
([(6, true, false, [158, 282, 254], [], 221)], 0, E213S233.L30),
([(6, true, false, [158, 282, 254], [], 223)], 0, E213S233.L31),
([(6, true, false, [158, 282, 254], [], 243)], 0, E213S233.L32),
([(6, true, false, [158, 282, 254], [], 244)], 0, E213S233.L33),
([(6, true, false, [158, 282, 254], [], 250)], 0, E213S233.L34),
([(6, true, false, [158, 282, 254], [], 257)], 0, E213S233.L35),
([(6, true, false, [158, 282, 254], [], 268)], 0, E213S233.L36),
([(6, true, false, [158, 282, 254], [], 305)], 0, E213S233.L37),
([(6, true, false, [158, 282, 254], [], 309)], 0, E213S233.L38),
([(6, true, false, [158, 282, 254], [], 312)], 0, E213S233.L39),
([(6, true, false, [158, 282, 254], [], 313)], 0, E213S233.L40),
([(6, true, false, [158, 282, 254], [], 316)], 0, E213S233.L41),
([(6, true, false, [158, 282, 254], [], 336)], 0, E213S233.L42),
([(6, true, false, [158, 282, 254], [], 346)], 0, E213S233.L43),
([(6, true, false, [158, 282, 254], [], 364)], 0, E213S233.L44),
([(6, true, false, [158, 282, 254], [], 401)], 0, E213S233.L45),
([(6, true, false, [158, 282, 254], [], 472)], 0, E213S233.L46),
([(6, true, false, [158, 282, 254], [], 508)], 0, E213S233.L47)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 47
end E213S233
