module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E382S0 "data/lean/b953edcf4c984cc7d333a85999b3c9bd/E382S0.bin"
namespace E382S0
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [], [341, 427], 13)], 0, E382S0.L1),
([(2, true, false, [], [341, 427], 30)], 0, E382S0.L2),
([(2, true, false, [], [341, 427], 32)], 0, E382S0.L3),
([(2, true, false, [], [341, 427], 33)], 0, E382S0.L4),
([(2, true, false, [], [341, 427], 34)], 0, E382S0.L5),
([(2, true, false, [], [341, 427], 45)], 0, E382S0.L6),
([(2, true, false, [], [341, 427], 47)], 0, E382S0.L7),
([(2, true, false, [], [341, 427], 59)], 0, E382S0.L8),
([(2, true, false, [], [341, 427], 92)], 0, E382S0.L9),
([(2, true, false, [], [341, 427], 110)], 0, E382S0.L10),
([(2, true, false, [], [341, 427], 118)], 0, E382S0.L11),
([(2, true, false, [], [341, 427], 147)], 0, E382S0.L12)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 12
end E382S0
