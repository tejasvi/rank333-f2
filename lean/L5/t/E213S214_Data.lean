module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S214 "data/lean/9a57d56682902a23c0c1ccad1df15d60/E213S214.bin"
namespace E213S214
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(10, true, false, [106, 158], [388], 4)], 0, E213S214.L1),
([(10, true, false, [106, 158], [388], 5)], 0, E213S214.L2),
([(10, true, false, [106, 158], [388], 8)], 0, E213S214.L3),
([(10, true, false, [106, 158], [388], 12)], 0, E213S214.L4),
([(10, true, false, [106, 158], [388], 13)], 0, E213S214.L5),
([(10, true, false, [106, 158], [388], 14)], 0, E213S214.L6),
([(10, true, false, [106, 158], [388], 15)], 0, E213S214.L7),
([(10, true, false, [106, 158], [388], 16)], 0, E213S214.L8),
([(10, true, false, [106, 158], [388], 17)], 0, E213S214.L9),
([(10, true, false, [106, 158], [388], 20)], 0, E213S214.L10),
([(10, true, false, [106, 158], [388], 21)], 0, E213S214.L11),
([(10, true, false, [106, 158], [388], 22)], 0, E213S214.L12),
([(10, true, false, [106, 158], [388], 23)], 0, E213S214.L13),
([(10, true, false, [106, 158], [388], 32)], 0, E213S214.L14),
([(10, true, false, [106, 158], [388], 33)], 0, E213S214.L15),
([(10, true, false, [106, 158], [388], 43)], 0, E213S214.L16),
([(10, true, false, [106, 158], [388], 45)], 0, E213S214.L17),
([(10, true, false, [106, 158], [388], 46)], 0, E213S214.L18),
([(10, true, false, [106, 158], [388], 47)], 0, E213S214.L19),
([(10, true, false, [106, 158], [388], 49)], 0, E213S214.L20),
([(10, true, false, [106, 158], [388], 57)], 0, E213S214.L21),
([(10, true, false, [106, 158], [388], 76)], 0, E213S214.L22),
([(10, true, false, [106, 158], [388], 113)], 0, E213S214.L23),
([(10, true, false, [106, 158], [388], 115)], 0, E213S214.L24),
([(10, true, false, [106, 158], [388], 116)], 0, E213S214.L25),
([(10, true, false, [106, 158], [388], 124)], 0, E213S214.L26),
([(10, true, false, [106, 158], [388], 130)], 0, E213S214.L27),
([(10, true, false, [106, 158], [388], 147)], 0, E213S214.L28),
([(10, true, false, [106, 158], [388], 184)], 0, E213S214.L29),
([(10, true, false, [106, 158], [388], 188)], 0, E213S214.L30),
([(10, true, false, [106, 158], [388], 192)], 0, E213S214.L31),
([(10, true, false, [106, 158], [388], 214)], 0, E213S214.L32)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 32
end E213S214
