module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E159S13 "data/lean/e4c75539ae3e5f239d5e5c18d3ae8934/E159S13.bin"
namespace E159S13
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(15, true, false, [340, 500], [256], 7)], 2, 0, E159S13.L1),
([(15, true, false, [340, 500], [256], 27)], 2, 0, E159S13.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E159S13
