module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S77 "data/lean/5087cabf13c856728f882506118ca3f2/E212S77.bin"
namespace E212S77
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [158, 254, 500], [404], 10)], 0, E212S77.L1),
([(4, true, false, [158, 254, 500], [404], 12)], 0, E212S77.L2),
([(4, true, false, [158, 254, 500], [404], 13)], 0, E212S77.L3),
([(4, true, false, [158, 254, 500], [404], 33)], 0, E212S77.L4),
([(4, true, false, [158, 254, 500], [404], 53)], 0, E212S77.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E212S77
