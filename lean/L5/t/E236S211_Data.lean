module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S211 "data/lean/27513e92ccf37eb2db6ea78e42726993/E236S211.bin"
namespace E236S211
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [354], [136, 508], 1)], 0, E236S211.L1),
([(8, true, false, [354], [136, 508], 25)], 0, E236S211.L2),
([(8, true, false, [354], [136, 508], 147)], 0, E236S211.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E236S211
