module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E237S50 "data/lean/56caa22fd1669ac3370d7240377589aa/E237S50.bin"
namespace E237S50
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [254, 412, 234], [508], 23)], 0, E237S50.L1),
([(2, true, false, [254, 412, 234], [508], 24)], 0, E237S50.L2),
([(2, true, false, [254, 412, 234], [508], 27)], 0, E237S50.L3),
([(2, true, false, [254, 412, 234], [508], 28)], 0, E237S50.L4),
([(2, true, false, [254, 412, 234], [508], 31)], 0, E237S50.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E237S50
