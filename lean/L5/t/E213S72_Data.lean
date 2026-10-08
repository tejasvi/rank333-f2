module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S72 "data/lean/0f09dddb1622d024c375e32436de347b/E213S72.bin"
namespace E213S72
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [106, 254, 494], [378], 2)], 0, E213S72.L1),
([(0, true, false, [106, 254, 494], [378], 9)], 0, E213S72.L2),
([(0, true, false, [106, 254, 494], [378], 35)], 0, E213S72.L3),
([(0, true, false, [106, 254, 494], [378], 41)], 0, E213S72.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E213S72
