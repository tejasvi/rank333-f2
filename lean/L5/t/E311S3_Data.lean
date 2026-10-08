module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E311S3 "data/lean/770e2426d5f114861c035260b84f8ebc/E311S3.bin"
namespace E311S3
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(9, true, false, [], [], 50)], 19, 0, E311S3.L1),
([(9, true, false, [], [], 51)], 19, 0, E311S3.L2),
([(9, true, false, [], [], 99)], 19, 0, E311S3.L3),
([(9, true, false, [], [], 100)], 19, 0, E311S3.L4),
([(9, true, false, [], [], 323)], 19, 0, E311S3.L5),
([(9, true, false, [], [], 324)], 19, 0, E311S3.L6),
([(9, true, false, [], [], 372)], 19, 0, E311S3.L7),
([(9, true, false, [], [], 373)], 19, 0, E311S3.L8),
([(9, true, false, [], [], 374)], 19, 0, E311S3.L9),
([(9, true, false, [], [], 398)], 19, 0, E311S3.L10),
([(9, true, false, [], [], 421)], 19, 0, E311S3.L11),
([(9, true, false, [], [], 437)], 19, 0, E311S3.L12),
([(9, true, false, [], [], 869)], 19, 0, E311S3.L13),
([(9, true, false, [], [], 870)], 19, 0, E311S3.L14),
([(9, true, false, [], [], 883)], 19, 0, E311S3.L15),
([(9, true, false, [], [], 891)], 19, 0, E311S3.L16),
([(9, true, false, [], [], 1395)], 19, 0, E311S3.L17),
([(9, true, false, [], [], 1408)], 19, 0, E311S3.L18),
([(9, true, false, [], [], 1416)], 19, 0, E311S3.L19)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 19
end E311S3
