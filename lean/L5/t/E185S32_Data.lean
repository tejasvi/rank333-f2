module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E185S32 "data/lean/5fe2367d52fc70ef15707ec766aab444/E185S32.bin"
namespace E185S32
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(0, true, false, [286, 346, 394], [], 0)], 3, 0, E185S32.L1),
([(0, true, false, [286, 346, 394], [], 5)], 3, 0, E185S32.L2),
([(0, true, false, [286, 346, 394], [], 16)], 3, 0, E185S32.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E185S32
