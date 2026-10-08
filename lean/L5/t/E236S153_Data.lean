module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S153 "data/lean/0d91c58a56262bb2e0dce2a91812e2ce/E236S153.bin"
namespace E236S153
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(15, true, false, [], [96, 276], 27)], 0, E236S153.L1),
([(15, true, false, [], [96, 276], 75)], 0, E236S153.L2),
([(15, true, false, [], [96, 276], 85)], 0, E236S153.L3),
([(15, true, false, [], [96, 276], 131)], 0, E236S153.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E236S153
