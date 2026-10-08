module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E335S3 "data/lean/05e2f5d332bdceb314d508c6d861201a/E335S3.bin"
namespace E335S3
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(10, true, false, [], [], 1)], 0, E335S3.L1),
([(10, true, false, [], [], 14)], 0, E335S3.L2),
([(10, true, false, [], [], 50)], 0, E335S3.L3),
([(10, true, false, [], [], 323)], 0, E335S3.L4),
([(10, true, false, [], [], 324)], 0, E335S3.L5),
([(10, true, false, [], [], 327)], 0, E335S3.L6),
([(10, true, false, [], [], 328)], 0, E335S3.L7),
([(10, true, false, [], [], 336)], 0, E335S3.L8),
([(10, true, false, [], [], 340)], 0, E335S3.L9),
([(10, true, false, [], [], 341)], 0, E335S3.L10),
([(10, true, false, [], [], 352)], 0, E335S3.L11),
([(10, true, false, [], [], 372)], 0, E335S3.L12),
([(10, true, false, [], [], 373)], 0, E335S3.L13),
([(10, true, false, [], [], 376)], 0, E335S3.L14),
([(10, true, false, [], [], 377)], 0, E335S3.L15),
([(10, true, false, [], [], 385)], 0, E335S3.L16),
([(10, true, false, [], [], 394)], 0, E335S3.L17),
([(10, true, false, [], [], 402)], 0, E335S3.L18),
([(10, true, false, [], [], 403)], 0, E335S3.L19),
([(10, true, false, [], [], 421)], 0, E335S3.L20),
([(10, true, false, [], [], 435)], 0, E335S3.L21),
([(10, true, false, [], [], 437)], 0, E335S3.L22),
([(10, true, false, [], [], 526)], 0, E335S3.L23)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 23
end E335S3
