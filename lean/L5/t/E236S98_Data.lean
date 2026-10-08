module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S98 "data/lean/4c6d18f4203596f7d7da110c4206ef19/E236S98.bin"
namespace E236S98
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [394], [490], 5)], 0, E236S98.L1),
([(7, true, false, [394], [490], 6)], 0, E236S98.L2),
([(7, true, false, [394], [490], 14)], 0, E236S98.L3),
([(7, true, false, [394], [490], 18)], 0, E236S98.L4),
([(7, true, false, [394], [490], 85)], 0, E236S98.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E236S98
