module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S371 "data/lean/bd3b11a91d9c8c055c0e4f68c65f21ea/E236S371.bin"
namespace E236S371
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(12, true, false, [372, 354], [136], 3)], 0, E236S371.L1),
([(12, true, false, [372, 354], [136], 23)], 0, E236S371.L2),
([(12, true, false, [372, 354], [136], 29)], 0, E236S371.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E236S371
