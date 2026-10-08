module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S30 "data/lean/b0819c4484d871f7c0c56f7fc465bb0a/E212S30.bin"
namespace E212S30
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(14, true, false, [254, 500], [26, 272], 59)], 0, E212S30.L1),
([(14, true, false, [254, 500], [26, 272], 113)], 0, E212S30.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E212S30
