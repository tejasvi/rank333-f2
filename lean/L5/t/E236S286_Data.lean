module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S286 "data/lean/0f77183ad9d5d64a5c3dba24e280a8ca/E236S286.bin"
namespace E236S286
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [254, 394], [232], 5)], 0, E236S286.L1),
([(8, true, false, [254, 394], [232], 17)], 0, E236S286.L2),
([(8, true, false, [254, 394], [232], 90)], 0, E236S286.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E236S286
