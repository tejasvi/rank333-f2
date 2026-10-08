module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S52 "data/lean/7ea53305a6a37438e71299f56db5f47a/E236S52.bin"
namespace E236S52
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(15, true, false, [], [96, 276], 10)], 0, E236S52.L1),
([(15, true, false, [], [96, 276], 27)], 0, E236S52.L2),
([(15, true, false, [], [96, 276], 131)], 0, E236S52.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E236S52
