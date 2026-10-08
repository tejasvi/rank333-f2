module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S98 "data/lean/9efec4dba66783c9c5066983d5e18b79/E212S98.bin"
namespace E212S98
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(12, true, false, [158, 254], [272, 368], 13)], 0, E212S98.L1),
([(12, true, false, [158, 254], [272, 368], 14)], 0, E212S98.L2),
([(12, true, false, [158, 254], [272, 368], 15)], 0, E212S98.L3),
([(12, true, false, [158, 254], [272, 368], 52)], 0, E212S98.L4),
([(12, true, false, [158, 254], [272, 368], 72)], 0, E212S98.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E212S98
