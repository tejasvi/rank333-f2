module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E159S32 "data/lean/23fdb0e3c65c1303d0a12aa53de15cbf/E159S32.bin"
namespace E159S32
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(12, true, false, [94, 426], [10, 510], 1)], 4, 0, E159S32.L1),
([(12, true, false, [94, 426], [10, 510], 5)], 4, 0, E159S32.L2),
([(12, true, false, [94, 426], [10, 510], 49)], 4, 0, E159S32.L3),
([(12, true, false, [94, 426], [10, 510], 104)], 4, 0, E159S32.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E159S32
