module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S23 "data/lean/015903aa4d4b247ade1130df9737c81c/E213S23.bin"
namespace E213S23
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [158, 106], [388], 4)], 0, E213S23.L1),
([(4, true, false, [158, 106], [388], 36)], 0, E213S23.L2),
([(4, true, false, [158, 106], [388], 48)], 0, E213S23.L3),
([(4, true, false, [158, 106], [388], 75)], 0, E213S23.L4),
([(4, true, false, [158, 106], [388], 77)], 0, E213S23.L5),
([(4, true, false, [158, 106], [388], 79)], 0, E213S23.L6),
([(4, true, false, [158, 106], [388], 95)], 0, E213S23.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E213S23
