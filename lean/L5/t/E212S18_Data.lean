module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S18 "data/lean/f1db051d79947db6e9b0502bc3cb37b1/E212S18.bin"
namespace E212S18
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [158], [404], 6)], 0, E212S18.L1),
([(13, true, false, [158], [404], 82)], 0, E212S18.L2),
([(13, true, false, [158], [404], 90)], 0, E212S18.L3),
([(13, true, false, [158], [404], 113)], 0, E212S18.L4),
([(13, true, false, [158], [404], 136)], 0, E212S18.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E212S18
