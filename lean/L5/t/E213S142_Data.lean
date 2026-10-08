module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S142 "data/lean/8092892364d8252e4f155a11079f2699/E213S142.bin"
namespace E213S142
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [254, 282], [96, 272], 13)], 0, E213S142.L1),
([(2, true, false, [254, 282], [96, 272], 17)], 0, E213S142.L2),
([(2, true, false, [254, 282], [96, 272], 23)], 0, E213S142.L3),
([(2, true, false, [254, 282], [96, 272], 27)], 0, E213S142.L4),
([(2, true, false, [254, 282], [96, 272], 42)], 0, E213S142.L5),
([(2, true, false, [254, 282], [96, 272], 46)], 0, E213S142.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E213S142
