module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S126 "data/lean/ceb2f355aa14a46022f4b0ef9f75952a/E213S126.bin"
namespace E213S126
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(14, true, false, [158, 254], [272, 368], 2)], 0, E213S126.L1),
([(14, true, false, [158, 254], [272, 368], 3)], 0, E213S126.L2),
([(14, true, false, [158, 254], [272, 368], 13)], 0, E213S126.L3),
([(14, true, false, [158, 254], [272, 368], 15)], 0, E213S126.L4),
([(14, true, false, [158, 254], [272, 368], 52)], 0, E213S126.L5),
([(14, true, false, [158, 254], [272, 368], 72)], 0, E213S126.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E213S126
