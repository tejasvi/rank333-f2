module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S232 "data/lean/7a0d40ea55bcdd7b5c19c92fc1653990/E236S232.bin"
namespace E236S232
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(11, true, false, [254, 372], [96], 42)], 0, E236S232.L1),
([(11, true, false, [254, 372], [96], 54)], 0, E236S232.L2),
([(11, true, false, [254, 372], [96], 82)], 0, E236S232.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E236S232
