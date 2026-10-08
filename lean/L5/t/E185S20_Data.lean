module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E185S20 "data/lean/7d4334fcf77febbae9a6360ef7b03266/E185S20.bin"
namespace E185S20
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(10, true, false, [384], [], 0), (6, false, false, [346], [], 0)], 2, 0, E185S20.L1),
([(10, true, false, [384], [], 0), (6, false, false, [346], [], 1)], 2, 0, E185S20.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E185S20
