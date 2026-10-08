module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S11 "data/lean/0beb89d5596fcfccd7279fa09af7fe20/E213S11.bin"
namespace E213S11
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [], [368, 378], 31)], 0, E213S11.L1),
([(6, true, false, [], [368, 378], 33)], 0, E213S11.L2),
([(6, true, false, [], [368, 378], 44)], 0, E213S11.L3),
([(6, true, false, [], [368, 378], 46)], 0, E213S11.L4),
([(6, true, false, [], [368, 378], 92)], 0, E213S11.L5),
([(6, true, false, [], [368, 378], 93)], 0, E213S11.L6),
([(6, true, false, [], [368, 378], 111)], 0, E213S11.L7),
([(6, true, false, [], [368, 378], 123)], 0, E213S11.L8),
([(6, true, false, [], [368, 378], 154)], 0, E213S11.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E213S11
