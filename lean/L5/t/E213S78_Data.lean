module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S78 "data/lean/b2c42161ea598123e8cdd2a3b201f189/E213S78.bin"
namespace E213S78
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [254, 158], [272], 5)], 0, E213S78.L1),
([(2, true, false, [254, 158], [272], 82)], 0, E213S78.L2),
([(2, true, false, [254, 158], [272], 88)], 0, E213S78.L3),
([(2, true, false, [254, 158], [272], 124)], 0, E213S78.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E213S78
