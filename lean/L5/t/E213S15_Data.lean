module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S15 "data/lean/0c6c904669edaaa72b76a9f8be6469e4/E213S15.bin"
namespace E213S15
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [106], [388], 5)], 0, E213S15.L1),
([(13, true, false, [106], [388], 7)], 0, E213S15.L2),
([(13, true, false, [106], [388], 10)], 0, E213S15.L3),
([(13, true, false, [106], [388], 15)], 0, E213S15.L4),
([(13, true, false, [106], [388], 17)], 0, E213S15.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E213S15
