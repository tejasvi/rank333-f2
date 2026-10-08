module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S151 "data/lean/5ced58e572de985e9aef26c3bae9aeec/E212S151.bin"
namespace E212S151
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [122, 254, 266], [272], 18)], 0, E212S151.L1),
([(6, true, false, [122, 254, 266], [272], 20)], 0, E212S151.L2),
([(6, true, false, [122, 254, 266], [272], 38)], 0, E212S151.L3),
([(6, true, false, [122, 254, 266], [272], 53)], 0, E212S151.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E212S151
