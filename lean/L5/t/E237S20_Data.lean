module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E237S20 "data/lean/6d59fe3cee4962634148dcb25202d35f/E237S20.bin"
namespace E237S20
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [234], [96, 508], 1)], 0, E237S20.L1),
([(6, true, false, [234], [96, 508], 11)], 0, E237S20.L2),
([(6, true, false, [234], [96, 508], 23)], 0, E237S20.L3),
([(6, true, false, [234], [96, 508], 49)], 0, E237S20.L4),
([(6, true, false, [234], [96, 508], 63)], 0, E237S20.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E237S20
