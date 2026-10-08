module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S61 "data/lean/2b34a6f5bdb7ec93b9e576a59e75f475/E212S61.bin"
namespace E212S61
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [494], [272, 362], 69)], 0, E212S61.L1),
([(7, true, false, [494], [272, 362], 93)], 0, E212S61.L2),
([(7, true, false, [494], [272, 362], 146)], 0, E212S61.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E212S61
