module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S45 "data/lean/13f43cb0b3340fafb03a00f22fed230c/E213S45.bin"
namespace E213S45
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [106, 254], [272], 1)], 0, E213S45.L1),
([(13, true, false, [106, 254], [272], 5)], 0, E213S45.L2),
([(13, true, false, [106, 254], [272], 6)], 0, E213S45.L3),
([(13, true, false, [106, 254], [272], 8)], 0, E213S45.L4),
([(13, true, false, [106, 254], [272], 17)], 0, E213S45.L5),
([(13, true, false, [106, 254], [272], 18)], 0, E213S45.L6),
([(13, true, false, [106, 254], [272], 22)], 0, E213S45.L7),
([(13, true, false, [106, 254], [272], 25)], 0, E213S45.L8),
([(13, true, false, [106, 254], [272], 32)], 0, E213S45.L9),
([(13, true, false, [106, 254], [272], 35)], 0, E213S45.L10),
([(13, true, false, [106, 254], [272], 40)], 0, E213S45.L11),
([(13, true, false, [106, 254], [272], 42)], 0, E213S45.L12),
([(13, true, false, [106, 254], [272], 44)], 0, E213S45.L13),
([(13, true, false, [106, 254], [272], 48)], 0, E213S45.L14),
([(13, true, false, [106, 254], [272], 78)], 0, E213S45.L15),
([(13, true, false, [106, 254], [272], 79)], 0, E213S45.L16),
([(13, true, false, [106, 254], [272], 82)], 0, E213S45.L17),
([(13, true, false, [106, 254], [272], 85)], 0, E213S45.L18),
([(13, true, false, [106, 254], [272], 90)], 0, E213S45.L19),
([(13, true, false, [106, 254], [272], 91)], 0, E213S45.L20),
([(13, true, false, [106, 254], [272], 116)], 0, E213S45.L21),
([(13, true, false, [106, 254], [272], 118)], 0, E213S45.L22),
([(13, true, false, [106, 254], [272], 121)], 0, E213S45.L23),
([(13, true, false, [106, 254], [272], 124)], 0, E213S45.L24),
([(13, true, false, [106, 254], [272], 128)], 0, E213S45.L25),
([(13, true, false, [106, 254], [272], 134)], 0, E213S45.L26),
([(13, true, false, [106, 254], [272], 140)], 0, E213S45.L27),
([(13, true, false, [106, 254], [272], 148)], 0, E213S45.L28),
([(13, true, false, [106, 254], [272], 152)], 0, E213S45.L29),
([(13, true, false, [106, 254], [272], 155)], 0, E213S45.L30),
([(13, true, false, [106, 254], [272], 170)], 0, E213S45.L31),
([(13, true, false, [106, 254], [272], 173)], 0, E213S45.L32),
([(13, true, false, [106, 254], [272], 176)], 0, E213S45.L33)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 33
end E213S45
