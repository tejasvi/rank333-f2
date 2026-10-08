module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S175 "data/lean/af4e4f41fc8a71806e2220d4a08d72c9/E213S175.bin"
namespace E213S175
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [158, 106], [96, 368], 1)], 0, E213S175.L1),
([(8, true, false, [158, 106], [96, 368], 2)], 0, E213S175.L2),
([(8, true, false, [158, 106], [96, 368], 8)], 0, E213S175.L3),
([(8, true, false, [158, 106], [96, 368], 10)], 0, E213S175.L4),
([(8, true, false, [158, 106], [96, 368], 11)], 0, E213S175.L5),
([(8, true, false, [158, 106], [96, 368], 16)], 0, E213S175.L6),
([(8, true, false, [158, 106], [96, 368], 31)], 0, E213S175.L7),
([(8, true, false, [158, 106], [96, 368], 39)], 0, E213S175.L8),
([(8, true, false, [158, 106], [96, 368], 43)], 0, E213S175.L9),
([(8, true, false, [158, 106], [96, 368], 53)], 0, E213S175.L10),
([(8, true, false, [158, 106], [96, 368], 54)], 0, E213S175.L11),
([(8, true, false, [158, 106], [96, 368], 59)], 0, E213S175.L12),
([(8, true, false, [158, 106], [96, 368], 60)], 0, E213S175.L13),
([(8, true, false, [158, 106], [96, 368], 63)], 0, E213S175.L14),
([(8, true, false, [158, 106], [96, 368], 72)], 0, E213S175.L15),
([(8, true, false, [158, 106], [96, 368], 74)], 0, E213S175.L16),
([(8, true, false, [158, 106], [96, 368], 97)], 0, E213S175.L17),
([(8, true, false, [158, 106], [96, 368], 110)], 0, E213S175.L18),
([(8, true, false, [158, 106], [96, 368], 117)], 0, E213S175.L19),
([(8, true, false, [158, 106], [96, 368], 121)], 0, E213S175.L20),
([(8, true, false, [158, 106], [96, 368], 122)], 0, E213S175.L21),
([(8, true, false, [158, 106], [96, 368], 124)], 0, E213S175.L22),
([(8, true, false, [158, 106], [96, 368], 127)], 0, E213S175.L23),
([(8, true, false, [158, 106], [96, 368], 128)], 0, E213S175.L24),
([(8, true, false, [158, 106], [96, 368], 131)], 0, E213S175.L25),
([(8, true, false, [158, 106], [96, 368], 148)], 0, E213S175.L26),
([(8, true, false, [158, 106], [96, 368], 152)], 0, E213S175.L27)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 27
end E213S175
