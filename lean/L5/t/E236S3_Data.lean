module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S3 "data/lean/c03cdf93358fb48a3a63d4f715ee4544/E236S3.bin"
namespace E236S3
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [254], [22], 74)], 0, E236S3.L1),
([(5, true, false, [254], [22], 77)], 0, E236S3.L2),
([(5, true, false, [254], [22], 80)], 0, E236S3.L3),
([(5, true, false, [254], [22], 89)], 0, E236S3.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E236S3
