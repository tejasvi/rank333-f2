module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S5 "data/lean/513e2ded6b5ed474a3d3498c6b89d51b/E284S5.bin"
namespace E284S5
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [256], [], 0), (7, false, false, [], [], 0)], 0, E284S5.L1),
([(6, true, false, [256], [], 0), (7, false, false, [], [], 1)], 0, E284S5.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E284S5
