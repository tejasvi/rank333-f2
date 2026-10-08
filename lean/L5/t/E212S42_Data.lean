module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S42 "data/lean/b997a2bb46d8493a457a02726d90083a/E212S42.bin"
namespace E212S42
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [266], [96], 38)], 0, E212S42.L1),
([(2, true, false, [266], [96], 46)], 0, E212S42.L2),
([(2, true, false, [266], [96], 58)], 0, E212S42.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E212S42
