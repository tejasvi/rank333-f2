module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S173 "data/lean/d44f081f4be9b451c44e9035eb81d18b/E212S173.bin"
namespace E212S173
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [158, 254, 500], [398], 18)], 0, E212S173.L1),
([(3, true, false, [158, 254, 500], [398], 19)], 0, E212S173.L2),
([(3, true, false, [158, 254, 500], [398], 22)], 0, E212S173.L3),
([(3, true, false, [158, 254, 500], [398], 34)], 0, E212S173.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E212S173
