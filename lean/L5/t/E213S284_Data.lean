module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S284 "data/lean/620ff1ff1d8077d7722ae3e09a1b2164/E213S284.bin"
namespace E213S284
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [244, 254, 282, 106], [], 15)], 0, E213S284.L1),
([(7, true, false, [244, 254, 282, 106], [], 21)], 0, E213S284.L2),
([(7, true, false, [244, 254, 282, 106], [], 56)], 0, E213S284.L3),
([(7, true, false, [244, 254, 282, 106], [], 58)], 0, E213S284.L4),
([(7, true, false, [244, 254, 282, 106], [], 59)], 0, E213S284.L5),
([(7, true, false, [244, 254, 282, 106], [], 85)], 0, E213S284.L6),
([(7, true, false, [244, 254, 282, 106], [], 88)], 0, E213S284.L7),
([(7, true, false, [244, 254, 282, 106], [], 141)], 0, E213S284.L8),
([(7, true, false, [244, 254, 282, 106], [], 169)], 0, E213S284.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E213S284
