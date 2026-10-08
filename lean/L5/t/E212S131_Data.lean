module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S131 "data/lean/148c78fe5107267bc48e3d4cf67500fa/E212S131.bin"
namespace E212S131
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [266, 494], [272], 23)], 0, E212S131.L1),
([(2, true, false, [266, 494], [272], 24)], 0, E212S131.L2),
([(2, true, false, [266, 494], [272], 29)], 0, E212S131.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E212S131
