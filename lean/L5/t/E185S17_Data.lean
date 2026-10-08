module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E185S17 "data/lean/045cfd7cf7a6b8b6dc7ace786408d974/E185S17.bin"
namespace E185S17
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(10, true, false, [384], [], 0), (6, false, false, [346], [], 0)], 5, 0, E185S17.L1),
([(10, true, false, [384], [], 0), (6, false, false, [346], [], 1)], 5, 0, E185S17.L2),
([(10, true, false, [384], [], 0), (6, false, false, [346], [], 2)], 5, 0, E185S17.L3),
([(10, true, false, [384], [], 0), (6, false, false, [346], [], 3)], 5, 0, E185S17.L4),
([(10, true, false, [384], [], 0), (6, false, false, [346], [], 4)], 5, 0, E185S17.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E185S17
