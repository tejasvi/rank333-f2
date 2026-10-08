module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S268 "data/lean/d6a94b023a5f08a730c10b7d1c397339/E236S268.bin"
namespace E236S268
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [354], [276, 490], 3)], 0, E236S268.L1),
([(6, true, false, [354], [276, 490], 4)], 0, E236S268.L2),
([(6, true, false, [354], [276, 490], 10)], 0, E236S268.L3),
([(6, true, false, [354], [276, 490], 33)], 0, E236S268.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E236S268
