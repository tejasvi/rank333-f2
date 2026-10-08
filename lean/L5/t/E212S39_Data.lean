module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S39 "data/lean/e384f27a5bb328de10eb7dc58458f03d/E212S39.bin"
namespace E212S39
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [266, 122], [404], 43)], 0, E212S39.L1),
([(13, true, false, [266, 122], [404], 62)], 0, E212S39.L2),
([(13, true, false, [266, 122], [404], 83)], 0, E212S39.L3),
([(13, true, false, [266, 122], [404], 89)], 0, E212S39.L4),
([(13, true, false, [266, 122], [404], 91)], 0, E212S39.L5),
([(13, true, false, [266, 122], [404], 138)], 0, E212S39.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E212S39
