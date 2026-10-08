module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S201 "data/lean/674a235bbc92bdb43d4efe6cc4327956/E213S201.bin"
namespace E213S201
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [106, 494], [148, 272], 15)], 0, E213S201.L1),
([(6, true, false, [106, 494], [148, 272], 17)], 0, E213S201.L2),
([(6, true, false, [106, 494], [148, 272], 18)], 0, E213S201.L3),
([(6, true, false, [106, 494], [148, 272], 19)], 0, E213S201.L4),
([(6, true, false, [106, 494], [148, 272], 22)], 0, E213S201.L5),
([(6, true, false, [106, 494], [148, 272], 41)], 0, E213S201.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E213S201
