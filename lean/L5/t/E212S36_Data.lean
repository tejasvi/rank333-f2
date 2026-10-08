module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S36 "data/lean/2bc793502c464841592684d1e69adfab/E212S36.bin"
namespace E212S36
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(12, true, false, [122, 254], [272, 404], 1)], 0, E212S36.L1),
([(12, true, false, [122, 254], [272, 404], 14)], 0, E212S36.L2),
([(12, true, false, [122, 254], [272, 404], 15)], 0, E212S36.L3),
([(12, true, false, [122, 254], [272, 404], 28)], 0, E212S36.L4),
([(12, true, false, [122, 254], [272, 404], 32)], 0, E212S36.L5),
([(12, true, false, [122, 254], [272, 404], 51)], 0, E212S36.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E212S36
