module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S22 "data/lean/c7539b13c0dd3e8c112c13b80c90c2bc/E236S22.bin"
namespace E236S22
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(15, true, false, [394], [232, 490], 29)], 0, E236S22.L1),
([(15, true, false, [394], [232, 490], 33)], 0, E236S22.L2),
([(15, true, false, [394], [232, 490], 55)], 0, E236S22.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E236S22
