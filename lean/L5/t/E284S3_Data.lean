module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S3 "data/lean/329c8462a1865197773366b7d9809051/E284S3.bin"
namespace E284S3
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [266, 468, 254], [10], 0)], 0, E284S3.L1),
([(3, true, false, [266, 468, 254], [10], 2)], 0, E284S3.L2),
([(3, true, false, [266, 468, 254], [10], 10)], 0, E284S3.L3),
([(3, true, false, [266, 468, 254], [10], 11)], 0, E284S3.L4),
([(3, true, false, [266, 468, 254], [10], 12)], 0, E284S3.L5),
([(3, true, false, [266, 468, 254], [10], 20)], 0, E284S3.L6),
([(3, true, false, [266, 468, 254], [10], 23)], 0, E284S3.L7),
([(3, true, false, [266, 468, 254], [10], 30)], 0, E284S3.L8),
([(3, true, false, [266, 468, 254], [10], 32)], 0, E284S3.L9),
([(3, true, false, [266, 468, 254], [10], 34)], 0, E284S3.L10),
([(3, true, false, [266, 468, 254], [10], 46)], 0, E284S3.L11),
([(3, true, false, [266, 468, 254], [10], 48)], 0, E284S3.L12),
([(3, true, false, [266, 468, 254], [10], 58)], 0, E284S3.L13),
([(3, true, false, [266, 468, 254], [10], 74)], 0, E284S3.L14)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 14
end E284S3
