module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S244 "data/lean/688cf37c9873b2041f8cc2ed1921a102/E213S244.bin"
namespace E213S244
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [254, 494], [96], 24)], 0, E213S244.L1),
([(4, true, false, [254, 494], [96], 30)], 0, E213S244.L2),
([(4, true, false, [254, 494], [96], 88)], 0, E213S244.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E213S244
