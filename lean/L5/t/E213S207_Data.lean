module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S207 "data/lean/d5730f5033555f6eec19154004d5017d/E213S207.bin"
namespace E213S207
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [158, 494], [388], 19)], 0, E213S207.L1),
([(3, true, false, [158, 494], [388], 38)], 0, E213S207.L2),
([(3, true, false, [158, 494], [388], 39)], 0, E213S207.L3),
([(3, true, false, [158, 494], [388], 41)], 0, E213S207.L4),
([(3, true, false, [158, 494], [388], 47)], 0, E213S207.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E213S207
