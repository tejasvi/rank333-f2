module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E382S3 "data/lean/256dac984268d8c913ea43c2a03c4051/E382S3.bin"
namespace E382S3
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [207, 299, 314], [], 69)], 0, E382S3.L1),
([(0, true, false, [207, 299, 314], [], 70)], 0, E382S3.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E382S3
