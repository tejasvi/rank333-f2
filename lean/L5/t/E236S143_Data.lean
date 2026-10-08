module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S143 "data/lean/8cf13364160fabba00d2bb63136cc9bd/E236S143.bin"
namespace E236S143
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(14, true, false, [354, 158], [22, 96], 7)], 1, E236S143.L1),
([(14, true, false, [354, 158], [22, 96], 7), (3, false, false, [], [22], 516)], 0, E236S143.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 1
end E236S143
