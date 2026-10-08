module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S43 "data/lean/dd7fe84a489510a141036fa966571d3c/E218S43.bin"
namespace E218S43
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [254, 494], [112, 352], 1)], 0, E218S43.L1),
([(8, true, false, [254, 494], [112, 352], 24)], 0, E218S43.L2),
([(8, true, false, [254, 494], [112, 352], 27)], 0, E218S43.L3),
([(8, true, false, [254, 494], [112, 352], 40)], 0, E218S43.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E218S43
