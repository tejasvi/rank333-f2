module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S52 "data/lean/360b5cd1905e6dfa355d486ec0ab37d4/E213S52.bin"
namespace E213S52
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [158, 254], [272, 368], 15)], 0, E213S52.L1),
([(8, true, false, [158, 254], [272, 368], 16)], 0, E213S52.L2),
([(8, true, false, [158, 254], [272, 368], 52)], 0, E213S52.L3),
([(8, true, false, [158, 254], [272, 368], 55)], 0, E213S52.L4),
([(8, true, false, [158, 254], [272, 368], 72)], 0, E213S52.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E213S52
