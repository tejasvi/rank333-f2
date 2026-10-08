module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S169 "data/lean/3ea0447f69951ea941ed2466fc73f928/E212S169.bin"
namespace E212S169
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(10, true, false, [158, 266, 122, 254], [398], 0)], 0, E212S169.L1),
([(10, true, false, [158, 266, 122, 254], [398], 14)], 0, E212S169.L2),
([(10, true, false, [158, 266, 122, 254], [398], 46)], 0, E212S169.L3),
([(10, true, false, [158, 266, 122, 254], [398], 69)], 0, E212S169.L4),
([(10, true, false, [158, 266, 122, 254], [398], 70)], 0, E212S169.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E212S169
