module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S67 "data/lean/043ef0a8cbe16725fcdfd7a09846343f/E207S67.bin"
namespace E207S67
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [286, 346, 266, 334], [], 11)], 0, E207S67.L1),
([(3, true, false, [286, 346, 266, 334], [], 20)], 0, E207S67.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E207S67
