module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S57 "data/lean/8e2522f608bdece5c83c6bfead08e3b4/E213S57.bin"
namespace E213S57
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [158, 106], [368], 5)], 0, E213S57.L1),
([(8, true, false, [158, 106], [368], 7)], 0, E213S57.L2),
([(8, true, false, [158, 106], [368], 8)], 0, E213S57.L3),
([(8, true, false, [158, 106], [368], 10)], 0, E213S57.L4),
([(8, true, false, [158, 106], [368], 11)], 0, E213S57.L5),
([(8, true, false, [158, 106], [368], 14)], 0, E213S57.L6),
([(8, true, false, [158, 106], [368], 20)], 0, E213S57.L7),
([(8, true, false, [158, 106], [368], 29)], 0, E213S57.L8),
([(8, true, false, [158, 106], [368], 35)], 0, E213S57.L9),
([(8, true, false, [158, 106], [368], 47)], 0, E213S57.L10),
([(8, true, false, [158, 106], [368], 49)], 0, E213S57.L11),
([(8, true, false, [158, 106], [368], 55)], 0, E213S57.L12),
([(8, true, false, [158, 106], [368], 59)], 0, E213S57.L13),
([(8, true, false, [158, 106], [368], 73)], 0, E213S57.L14),
([(8, true, false, [158, 106], [368], 81)], 0, E213S57.L15),
([(8, true, false, [158, 106], [368], 94)], 0, E213S57.L16),
([(8, true, false, [158, 106], [368], 117)], 0, E213S57.L17),
([(8, true, false, [158, 106], [368], 118)], 0, E213S57.L18),
([(8, true, false, [158, 106], [368], 119)], 0, E213S57.L19),
([(8, true, false, [158, 106], [368], 122)], 0, E213S57.L20),
([(8, true, false, [158, 106], [368], 123)], 0, E213S57.L21),
([(8, true, false, [158, 106], [368], 124)], 0, E213S57.L22),
([(8, true, false, [158, 106], [368], 127)], 0, E213S57.L23),
([(8, true, false, [158, 106], [368], 129)], 0, E213S57.L24),
([(8, true, false, [158, 106], [368], 134)], 0, E213S57.L25),
([(8, true, false, [158, 106], [368], 143)], 0, E213S57.L26),
([(8, true, false, [158, 106], [368], 148)], 0, E213S57.L27),
([(8, true, false, [158, 106], [368], 159)], 0, E213S57.L28),
([(8, true, false, [158, 106], [368], 164)], 0, E213S57.L29),
([(8, true, false, [158, 106], [368], 173)], 0, E213S57.L30),
([(8, true, false, [158, 106], [368], 180)], 0, E213S57.L31),
([(8, true, false, [158, 106], [368], 234)], 0, E213S57.L32),
([(8, true, false, [158, 106], [368], 250)], 0, E213S57.L33),
([(8, true, false, [158, 106], [368], 269)], 0, E213S57.L34),
([(8, true, false, [158, 106], [368], 274)], 0, E213S57.L35)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 35
end E213S57
