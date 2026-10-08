module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S80 "data/lean/e06339e148cc1c6348353234bea73e4c/E207S80.bin"
namespace E207S80
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [334, 266], [80, 160], 1)], 0, E207S80.L1),
([(8, true, false, [334, 266], [80, 160], 2)], 0, E207S80.L2),
([(8, true, false, [334, 266], [80, 160], 26)], 0, E207S80.L3),
([(8, true, false, [334, 266], [80, 160], 31)], 0, E207S80.L4),
([(8, true, false, [334, 266], [80, 160], 33)], 0, E207S80.L5),
([(8, true, false, [334, 266], [80, 160], 34)], 0, E207S80.L6),
([(8, true, false, [334, 266], [80, 160], 37)], 0, E207S80.L7),
([(8, true, false, [334, 266], [80, 160], 38)], 0, E207S80.L8),
([(8, true, false, [334, 266], [80, 160], 40)], 0, E207S80.L9),
([(8, true, false, [334, 266], [80, 160], 42)], 0, E207S80.L10),
([(8, true, false, [334, 266], [80, 160], 45)], 0, E207S80.L11),
([(8, true, false, [334, 266], [80, 160], 80)], 0, E207S80.L12),
([(8, true, false, [334, 266], [80, 160], 83)], 0, E207S80.L13),
([(8, true, false, [334, 266], [80, 160], 87)], 0, E207S80.L14),
([(8, true, false, [334, 266], [80, 160], 89)], 0, E207S80.L15),
([(8, true, false, [334, 266], [80, 160], 90)], 0, E207S80.L16)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 16
end E207S80
