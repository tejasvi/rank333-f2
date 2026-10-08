module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E159S12 "data/lean/fa5e858591569c919e81207ab67c531c/E159S12.bin"
namespace E159S12
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(15, true, false, [340, 500], [256], 1)], 3, 0, E159S12.L1),
([(15, true, false, [340, 500], [256], 6)], 3, 0, E159S12.L2),
([(15, true, false, [340, 500], [256], 24)], 3, 0, E159S12.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E159S12
