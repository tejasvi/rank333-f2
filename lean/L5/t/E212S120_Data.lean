module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S120 "data/lean/2600b654abd0ce6fdc96eeff32a47783/E212S120.bin"
namespace E212S120
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [254, 158], [228], 36)], 0, E212S120.L1),
([(7, true, false, [254, 158], [228], 37)], 0, E212S120.L2),
([(7, true, false, [254, 158], [228], 49)], 0, E212S120.L3),
([(7, true, false, [254, 158], [228], 77)], 0, E212S120.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E212S120
