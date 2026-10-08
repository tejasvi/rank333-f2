module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E279S6 "data/lean/9111fb3a97da570df6c92712b890fc7f/E279S6.bin"
namespace E279S6
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [], [10, 138], 1)], 0, E279S6.L1),
([(0, true, false, [], [10, 138], 5)], 0, E279S6.L2),
([(0, true, false, [], [10, 138], 99)], 0, E279S6.L3),
([(0, true, false, [], [10, 138], 103)], 0, E279S6.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E279S6
