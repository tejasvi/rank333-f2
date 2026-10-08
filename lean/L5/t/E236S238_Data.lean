module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S238 "data/lean/2d5933d1fb8b18e23eac752568766ad5/E236S238.bin"
namespace E236S238
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [158, 354, 412], [136], 0)], 0, E236S238.L1),
([(0, true, false, [158, 354, 412], [136], 10)], 0, E236S238.L2),
([(0, true, false, [158, 354, 412], [136], 22)], 0, E236S238.L3),
([(0, true, false, [158, 354, 412], [136], 23)], 0, E236S238.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E236S238
