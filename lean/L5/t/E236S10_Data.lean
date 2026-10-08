module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S10 "data/lean/07a07a026ec3b23c480765006d8bb020/E236S10.bin"
namespace E236S10
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(16, true, false, [], [22, 96], 27)], 0, E236S10.L1),
([(16, true, false, [], [22, 96], 31)], 0, E236S10.L2),
([(16, true, false, [], [22, 96], 44)], 0, E236S10.L3),
([(16, true, false, [], [22, 96], 53)], 0, E236S10.L4),
([(16, true, false, [], [22, 96], 76)], 0, E236S10.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E236S10
