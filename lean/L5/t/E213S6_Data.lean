module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S6 "data/lean/cb784be3e19586a1cedcde996f45a6b3/E213S6.bin"
namespace E213S6
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(15, true, false, [272], [], 4)], 0, E213S6.L1),
([(15, true, false, [272], [], 5)], 0, E213S6.L2),
([(15, true, false, [272], [], 9)], 0, E213S6.L3),
([(15, true, false, [272], [], 12)], 0, E213S6.L4),
([(15, true, false, [272], [], 16)], 0, E213S6.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E213S6
