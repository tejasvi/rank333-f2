module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E204S3 "data/lean/cac20562d940c7efb4da613b217efdd1/E204S3.bin"
namespace E204S3
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [372, 468], [], 1)], 0, E204S3.L1),
([(5, true, false, [372, 468], [], 21)], 0, E204S3.L2),
([(5, true, false, [372, 468], [], 74)], 0, E204S3.L3),
([(5, true, false, [372, 468], [], 75)], 0, E204S3.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E204S3
