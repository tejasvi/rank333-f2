module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S35 "data/lean/3279eb4673ce76db728cf5ce1c13d2c8/E213S35.bin"
namespace E213S35
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [], [368, 378], 31)], 0, E213S35.L1),
([(6, true, false, [], [368, 378], 33)], 0, E213S35.L2),
([(6, true, false, [], [368, 378], 49)], 0, E213S35.L3),
([(6, true, false, [], [368, 378], 51)], 0, E213S35.L4),
([(6, true, false, [], [368, 378], 92)], 0, E213S35.L5),
([(6, true, false, [], [368, 378], 93)], 0, E213S35.L6),
([(6, true, false, [], [368, 378], 95)], 0, E213S35.L7),
([(6, true, false, [], [368, 378], 96)], 0, E213S35.L8),
([(6, true, false, [], [368, 378], 111)], 0, E213S35.L9),
([(6, true, false, [], [368, 378], 123)], 0, E213S35.L10),
([(6, true, false, [], [368, 378], 136)], 0, E213S35.L11),
([(6, true, false, [], [368, 378], 138)], 0, E213S35.L12)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 12
end E213S35
