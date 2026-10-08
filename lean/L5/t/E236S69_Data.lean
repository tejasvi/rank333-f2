module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S69 "data/lean/ea68853c5e3a8d4fc584f4dd0bd1dec7/E236S69.bin"
namespace E236S69
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [372, 412], [22], 24)], 0, E236S69.L1),
([(6, true, false, [372, 412], [22], 27)], 0, E236S69.L2),
([(6, true, false, [372, 412], [22], 31)], 0, E236S69.L3),
([(6, true, false, [372, 412], [22], 39)], 0, E236S69.L4),
([(6, true, false, [372, 412], [22], 72)], 0, E236S69.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E236S69
