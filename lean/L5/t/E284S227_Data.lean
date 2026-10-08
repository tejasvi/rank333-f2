module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S227 "data/lean/e04116b896ef5b2c97fa842bd4b4bcf3/E284S227.bin"
namespace E284S227
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [212, 468, 500], [510], 39)], 0, E284S227.L1),
([(0, true, false, [212, 468, 500], [510], 55)], 0, E284S227.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E284S227
