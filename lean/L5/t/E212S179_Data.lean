module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S179 "data/lean/7c903d2b629e7a8ef2f792f058e9b04a/E212S179.bin"
namespace E212S179
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [122, 266, 500, 158], [], 0)], 0, E212S179.L1),
([(8, true, false, [122, 266, 500, 158], [], 10)], 0, E212S179.L2),
([(8, true, false, [122, 266, 500, 158], [], 11)], 0, E212S179.L3),
([(8, true, false, [122, 266, 500, 158], [], 12)], 0, E212S179.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E212S179
