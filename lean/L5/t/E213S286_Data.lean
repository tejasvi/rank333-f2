module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S286 "data/lean/a38b8a00bbf7ff860f4a13bfe7907431/E213S286.bin"
namespace E213S286
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(1, true, false, [106, 254, 494], [96], 1)], 0, E213S286.L1),
([(1, true, false, [106, 254, 494], [96], 21)], 0, E213S286.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E213S286
