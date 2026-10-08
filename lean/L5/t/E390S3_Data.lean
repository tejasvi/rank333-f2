module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E390S3 "data/lean/67c465ebeeaa6f4c3144e9bc80d82d2c/E390S3.bin"
namespace E390S3
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(10, true, false, [], [], 4)], 0, E390S3.L1),
([(10, true, false, [], [], 51)], 0, E390S3.L2),
([(10, true, false, [], [], 52)], 0, E390S3.L3),
([(10, true, false, [], [], 53)], 0, E390S3.L4),
([(10, true, false, [], [], 71)], 0, E390S3.L5),
([(10, true, false, [], [], 73)], 0, E390S3.L6),
([(10, true, false, [], [], 101)], 0, E390S3.L7),
([(10, true, false, [], [], 374)], 0, E390S3.L8),
([(10, true, false, [], [], 375)], 0, E390S3.L9),
([(10, true, false, [], [], 598)], 0, E390S3.L10),
([(10, true, false, [], [], 599)], 0, E390S3.L11),
([(10, true, false, [], [], 601)], 0, E390S3.L12),
([(10, true, false, [], [], 648)], 0, E390S3.L13),
([(10, true, false, [], [], 697)], 0, E390S3.L14),
([(10, true, false, [], [], 732)], 0, E390S3.L15),
([(10, true, false, [], [], 1047)], 0, E390S3.L16),
([(10, true, false, [], [], 1087)], 0, E390S3.L17),
([(10, true, false, [], [], 1424)], 0, E390S3.L18),
([(10, true, false, [], [], 1428)], 0, E390S3.L19)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 19
end E390S3
