module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E379S0 "data/lean/402ee61bcaf19a17f367e9df4f26bd12/E379S0.bin"
namespace E379S0
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [256], [], 0), (7, false, false, [382], [], 0)], 0, E379S0.L1),
([(6, true, false, [256], [], 0), (7, false, false, [382], [], 1)], 0, E379S0.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E379S0
