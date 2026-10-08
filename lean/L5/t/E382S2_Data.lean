module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E382S2 "data/lean/d56be730b8c76bcf004fe697893365f2/E382S2.bin"
namespace E382S2
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(10, true, false, [], [79, 427], 10)], 0, E382S2.L1),
([(10, true, false, [], [79, 427], 14)], 0, E382S2.L2),
([(10, true, false, [], [79, 427], 43)], 0, E382S2.L3),
([(10, true, false, [], [79, 427], 47)], 0, E382S2.L4),
([(10, true, false, [], [79, 427], 91)], 0, E382S2.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E382S2
