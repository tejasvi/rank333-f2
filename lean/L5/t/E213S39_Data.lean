module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S39 "data/lean/12383a2bd24f6263fd0f3ab6402d3fa4/E213S39.bin"
namespace E213S39
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [106], [96], 0)], 0, E213S39.L1),
([(6, true, false, [106], [96], 2)], 0, E213S39.L2),
([(6, true, false, [106], [96], 21)], 0, E213S39.L3),
([(6, true, false, [106], [96], 36)], 0, E213S39.L4),
([(6, true, false, [106], [96], 48)], 0, E213S39.L5),
([(6, true, false, [106], [96], 92)], 0, E213S39.L6),
([(6, true, false, [106], [96], 100)], 0, E213S39.L7),
([(6, true, false, [106], [96], 169)], 0, E213S39.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 8
end E213S39
