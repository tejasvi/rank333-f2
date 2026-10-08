module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S91 "data/lean/631674ce9db8ab14f0380f34266b3ba8/E213S91.bin"
namespace E213S91
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [282, 494], [148], 24)], 0, E213S91.L1),
([(7, true, false, [282, 494], [148], 26)], 0, E213S91.L2),
([(7, true, false, [282, 494], [148], 61)], 0, E213S91.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E213S91
