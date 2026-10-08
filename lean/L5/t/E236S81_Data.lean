module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S81 "data/lean/4a021d2167b6ef90fb1025ffa5e7dcb0/E236S81.bin"
namespace E236S81
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(15, true, false, [412, 158, 254], [508], 10)], 0, E236S81.L1),
([(15, true, false, [412, 158, 254], [508], 45)], 0, E236S81.L2),
([(15, true, false, [412, 158, 254], [508], 81)], 0, E236S81.L3),
([(15, true, false, [412, 158, 254], [508], 162)], 0, E236S81.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E236S81
