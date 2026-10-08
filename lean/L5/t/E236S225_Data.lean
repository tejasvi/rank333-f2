module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S225 "data/lean/fa7d5226a4cf1be46f08713d71fe8071/E236S225.bin"
namespace E236S225
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [372], [258, 508], 1)], 0, E236S225.L1),
([(6, true, false, [372], [258, 508], 13)], 0, E236S225.L2),
([(6, true, false, [372], [258, 508], 14)], 0, E236S225.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E236S225
