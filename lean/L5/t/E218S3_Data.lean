module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S3 "data/lean/7042f256b7020043f4af2517a8c6b90d/E218S3.bin"
namespace E218S3
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [500], [112], 2)], 0, E218S3.L1),
([(8, true, false, [500], [112], 25)], 0, E218S3.L2),
([(8, true, false, [500], [112], 43)], 0, E218S3.L3),
([(8, true, false, [500], [112], 78)], 0, E218S3.L4),
([(8, true, false, [500], [112], 80)], 0, E218S3.L5),
([(8, true, false, [500], [112], 86)], 0, E218S3.L6),
([(8, true, false, [500], [112], 88)], 0, E218S3.L7),
([(8, true, false, [500], [112], 199)], 0, E218S3.L8),
([(8, true, false, [500], [112], 203)], 0, E218S3.L9),
([(8, true, false, [500], [112], 216)], 0, E218S3.L10),
([(8, true, false, [500], [112], 219)], 0, E218S3.L11)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 11
end E218S3
