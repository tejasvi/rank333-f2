module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S130 "data/lean/f0d5d3d8c43aa8136cfea8da1fdd37b6/E212S130.bin"
namespace E212S130
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [254, 266], [96, 272], 1)], 0, E212S130.L1),
([(8, true, false, [254, 266], [96, 272], 13)], 0, E212S130.L2),
([(8, true, false, [254, 266], [96, 272], 17)], 0, E212S130.L3),
([(8, true, false, [254, 266], [96, 272], 27)], 0, E212S130.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E212S130
