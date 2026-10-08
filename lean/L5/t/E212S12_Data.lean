module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S12 "data/lean/c43e2295688855b6d63913f5cd5987b3/E212S12.bin"
namespace E212S12
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [158, 254], [272, 368], 13)], 0, E212S12.L1),
([(8, true, false, [158, 254], [272, 368], 14)], 0, E212S12.L2),
([(8, true, false, [158, 254], [272, 368], 15)], 0, E212S12.L3),
([(8, true, false, [158, 254], [272, 368], 52)], 0, E212S12.L4),
([(8, true, false, [158, 254], [272, 368], 56)], 0, E212S12.L5),
([(8, true, false, [158, 254], [272, 368], 72)], 0, E212S12.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E212S12
