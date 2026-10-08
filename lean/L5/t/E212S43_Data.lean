module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S43 "data/lean/9712d7029a6e7a35dbdb46367ba8a97e/E212S43.bin"
namespace E212S43
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(10, true, false, [266], [96], 20)], 0, E212S43.L1),
([(10, true, false, [266], [96], 168)], 0, E212S43.L2),
([(10, true, false, [266], [96], 212)], 0, E212S43.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E212S43
