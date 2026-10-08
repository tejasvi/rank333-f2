module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S313 "data/lean/f8dfc46525607caf145b2635fe328302/E284S313.bin"
namespace E284S313
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [298, 394, 426, 266], [10, 42], 2)], 0, E284S313.L1),
([(2, true, false, [298, 394, 426, 266], [10, 42], 3)], 0, E284S313.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E284S313
