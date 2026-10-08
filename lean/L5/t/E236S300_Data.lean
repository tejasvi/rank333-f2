module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S300 "data/lean/37949034b5c65513225483a567575e59/E236S300.bin"
namespace E236S300
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [254, 354, 372], [258], 0)], 0, E236S300.L1),
([(2, true, false, [254, 354, 372], [258], 2)], 0, E236S300.L2),
([(2, true, false, [254, 354, 372], [258], 22)], 0, E236S300.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E236S300
