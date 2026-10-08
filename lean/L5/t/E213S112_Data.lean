module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S112 "data/lean/3cd548deeb2623771c3aad8e351963f7/E213S112.bin"
namespace E213S112
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [158, 254], [272, 368], 13)], 0, E213S112.L1),
([(9, true, false, [158, 254], [272, 368], 14)], 0, E213S112.L2),
([(9, true, false, [158, 254], [272, 368], 15)], 0, E213S112.L3),
([(9, true, false, [158, 254], [272, 368], 16)], 0, E213S112.L4),
([(9, true, false, [158, 254], [272, 368], 52)], 0, E213S112.L5),
([(9, true, false, [158, 254], [272, 368], 72)], 0, E213S112.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E213S112
