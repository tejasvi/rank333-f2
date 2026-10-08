module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S49 "data/lean/2fc4ef0d71a25ac4d173b6097238a833/E213S49.bin"
namespace E213S49
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [158], [96, 368], 0)], 0, E213S49.L1),
([(9, true, false, [158], [96, 368], 1)], 0, E213S49.L2),
([(9, true, false, [158], [96, 368], 2)], 0, E213S49.L3),
([(9, true, false, [158], [96, 368], 4)], 0, E213S49.L4),
([(9, true, false, [158], [96, 368], 8)], 0, E213S49.L5),
([(9, true, false, [158], [96, 368], 9)], 0, E213S49.L6),
([(9, true, false, [158], [96, 368], 10)], 0, E213S49.L7),
([(9, true, false, [158], [96, 368], 11)], 0, E213S49.L8),
([(9, true, false, [158], [96, 368], 12)], 0, E213S49.L9),
([(9, true, false, [158], [96, 368], 15)], 0, E213S49.L10),
([(9, true, false, [158], [96, 368], 16)], 0, E213S49.L11),
([(9, true, false, [158], [96, 368], 27)], 0, E213S49.L12),
([(9, true, false, [158], [96, 368], 29)], 0, E213S49.L13),
([(9, true, false, [158], [96, 368], 31)], 0, E213S49.L14),
([(9, true, false, [158], [96, 368], 33)], 0, E213S49.L15),
([(9, true, false, [158], [96, 368], 39)], 0, E213S49.L16),
([(9, true, false, [158], [96, 368], 43)], 0, E213S49.L17),
([(9, true, false, [158], [96, 368], 51)], 0, E213S49.L18),
([(9, true, false, [158], [96, 368], 53)], 0, E213S49.L19),
([(9, true, false, [158], [96, 368], 54)], 0, E213S49.L20),
([(9, true, false, [158], [96, 368], 56)], 0, E213S49.L21),
([(9, true, false, [158], [96, 368], 59)], 0, E213S49.L22),
([(9, true, false, [158], [96, 368], 60)], 0, E213S49.L23),
([(9, true, false, [158], [96, 368], 63)], 0, E213S49.L24),
([(9, true, false, [158], [96, 368], 64)], 0, E213S49.L25),
([(9, true, false, [158], [96, 368], 65)], 0, E213S49.L26),
([(9, true, false, [158], [96, 368], 66)], 0, E213S49.L27),
([(9, true, false, [158], [96, 368], 108)], 0, E213S49.L28),
([(9, true, false, [158], [96, 368], 109)], 0, E213S49.L29),
([(9, true, false, [158], [96, 368], 121)], 0, E213S49.L30),
([(9, true, false, [158], [96, 368], 122)], 0, E213S49.L31),
([(9, true, false, [158], [96, 368], 124)], 0, E213S49.L32),
([(9, true, false, [158], [96, 368], 127)], 0, E213S49.L33),
([(9, true, false, [158], [96, 368], 128)], 0, E213S49.L34),
([(9, true, false, [158], [96, 368], 131)], 0, E213S49.L35),
([(9, true, false, [158], [96, 368], 142)], 0, E213S49.L36)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 36
end E213S49
