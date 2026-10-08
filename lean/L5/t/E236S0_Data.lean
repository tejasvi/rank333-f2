module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S0 "data/lean/d0ac5253efb20fcf389cc0760708d3ef/E236S0.bin"
namespace E236S0
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [], [258, 508], 30)], 0, E236S0.L1),
([(7, true, false, [], [258, 508], 32)], 0, E236S0.L2),
([(7, true, false, [], [258, 508], 39)], 0, E236S0.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E236S0
