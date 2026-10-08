module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S171 "data/lean/31bfc354b81658f686161463d613cdc4/E213S171.bin"
namespace E213S171
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [106, 254], [272], 0)], 0, E213S171.L1),
([(2, true, false, [106, 254], [272], 12)], 0, E213S171.L2),
([(2, true, false, [106, 254], [272], 13)], 0, E213S171.L3),
([(2, true, false, [106, 254], [272], 14)], 0, E213S171.L4),
([(2, true, false, [106, 254], [272], 15)], 0, E213S171.L5),
([(2, true, false, [106, 254], [272], 17)], 0, E213S171.L6),
([(2, true, false, [106, 254], [272], 18)], 0, E213S171.L7),
([(2, true, false, [106, 254], [272], 19)], 0, E213S171.L8),
([(2, true, false, [106, 254], [272], 25)], 0, E213S171.L9),
([(2, true, false, [106, 254], [272], 26)], 0, E213S171.L10),
([(2, true, false, [106, 254], [272], 29)], 0, E213S171.L11),
([(2, true, false, [106, 254], [272], 30)], 0, E213S171.L12),
([(2, true, false, [106, 254], [272], 31)], 0, E213S171.L13),
([(2, true, false, [106, 254], [272], 32)], 0, E213S171.L14),
([(2, true, false, [106, 254], [272], 33)], 0, E213S171.L15),
([(2, true, false, [106, 254], [272], 34)], 0, E213S171.L16),
([(2, true, false, [106, 254], [272], 39)], 0, E213S171.L17),
([(2, true, false, [106, 254], [272], 40)], 0, E213S171.L18),
([(2, true, false, [106, 254], [272], 46)], 0, E213S171.L19),
([(2, true, false, [106, 254], [272], 47)], 0, E213S171.L20),
([(2, true, false, [106, 254], [272], 63)], 0, E213S171.L21),
([(2, true, false, [106, 254], [272], 66)], 0, E213S171.L22),
([(2, true, false, [106, 254], [272], 76)], 0, E213S171.L23),
([(2, true, false, [106, 254], [272], 82)], 0, E213S171.L24),
([(2, true, false, [106, 254], [272], 100)], 0, E213S171.L25),
([(2, true, false, [106, 254], [272], 124)], 0, E213S171.L26),
([(2, true, false, [106, 254], [272], 130)], 0, E213S171.L27),
([(2, true, false, [106, 254], [272], 131)], 0, E213S171.L28),
([(2, true, false, [106, 254], [272], 133)], 0, E213S171.L29),
([(2, true, false, [106, 254], [272], 134)], 0, E213S171.L30),
([(2, true, false, [106, 254], [272], 135)], 0, E213S171.L31),
([(2, true, false, [106, 254], [272], 139)], 0, E213S171.L32),
([(2, true, false, [106, 254], [272], 145)], 0, E213S171.L33),
([(2, true, false, [106, 254], [272], 146)], 0, E213S171.L34),
([(2, true, false, [106, 254], [272], 151)], 0, E213S171.L35),
([(2, true, false, [106, 254], [272], 153)], 0, E213S171.L36),
([(2, true, false, [106, 254], [272], 156)], 0, E213S171.L37),
([(2, true, false, [106, 254], [272], 160)], 0, E213S171.L38),
([(2, true, false, [106, 254], [272], 164)], 0, E213S171.L39)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 39
end E213S171
