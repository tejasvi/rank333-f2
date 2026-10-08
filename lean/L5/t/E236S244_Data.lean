module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S244 "data/lean/38fb9337ab1f30e465f36adeedc4c511/E236S244.bin"
namespace E236S244
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [158, 254, 372], [232], 0)], 0, E236S244.L1),
([(2, true, false, [158, 254, 372], [232], 32)], 0, E236S244.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E236S244
