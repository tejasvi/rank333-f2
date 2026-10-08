module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S37 "data/lean/6dcbc1edcb2f2ec52e0c1a6fb6707261/E213S37.bin"
namespace E213S37
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [], [368, 378], 31)], 0, E213S37.L1),
([(6, true, false, [], [368, 378], 33)], 0, E213S37.L2),
([(6, true, false, [], [368, 378], 93)], 0, E213S37.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E213S37
