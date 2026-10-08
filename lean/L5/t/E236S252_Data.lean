module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S252 "data/lean/b6be650867ab2c8ee23e64a58f2eaaea/E236S252.bin"
namespace E236S252
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [354, 372, 412], [276], 39)], 0, E236S252.L1),
([(2, true, false, [354, 372, 412], [276], 58)], 0, E236S252.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E236S252
