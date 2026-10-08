module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S85 "data/lean/be665d2433dcd898fb8479833cbe091a/E212S85.bin"
namespace E212S85
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(11, true, false, [122, 500], [272], 41)], 0, E212S85.L1),
([(11, true, false, [122, 500], [272], 45)], 0, E212S85.L2),
([(11, true, false, [122, 500], [272], 64)], 0, E212S85.L3),
([(11, true, false, [122, 500], [272], 98)], 0, E212S85.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E212S85
