module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S69 "data/lean/0bca0edcfd6a6d45bb23e5814d9018ac/E213S69.bin"
namespace E213S69
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [282, 158, 244], [368], 77)], 0, E213S69.L1),
([(13, true, false, [282, 158, 244], [368], 83)], 0, E213S69.L2),
([(13, true, false, [282, 158, 244], [368], 177)], 0, E213S69.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E213S69
