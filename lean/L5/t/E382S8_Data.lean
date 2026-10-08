module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E382S8 "data/lean/c35d559446b65d02b5f1ac2a690d4223/E382S8.bin"
namespace E382S8
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [207, 395, 410], [126], 1)], 0, E382S8.L1),
([(0, true, false, [207, 395, 410], [126], 5)], 0, E382S8.L2),
([(0, true, false, [207, 395, 410], [126], 19)], 0, E382S8.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E382S8
