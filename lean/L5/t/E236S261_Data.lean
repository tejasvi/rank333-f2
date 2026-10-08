module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S261 "data/lean/aee7ae7c93e0d079e721ffaa99c4e843/E236S261.bin"
namespace E236S261
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(15, true, false, [158, 412], [22, 276], 2)], 0, E236S261.L1),
([(15, true, false, [158, 412], [22, 276], 6)], 0, E236S261.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E236S261
