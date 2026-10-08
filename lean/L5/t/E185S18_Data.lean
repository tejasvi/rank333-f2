module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E185S18 "data/lean/74bfeee83c6c203673ceada5b87b3c53/E185S18.bin"
namespace E185S18
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(13, true, false, [218, 394], [10, 208, 384], 0)], 2, 5, E185S18.L1),
([(13, true, false, [218, 394], [10, 208, 384], 7)], 7, 0, E185S18.L2),
([(13, true, false, [218, 394], [10, 208, 384], 0), (6, false, false, [384, 10, 346], [], 4)], 7, 0, E185S18.L3),
([(13, true, false, [218, 394], [10, 208, 384], 0), (6, false, false, [384, 10, 346], [], 6)], 7, 0, E185S18.L4),
([(13, true, false, [218, 394], [10, 208, 384], 0), (6, false, false, [384, 10, 346], [], 12)], 7, 0, E185S18.L5),
([(13, true, false, [218, 394], [10, 208, 384], 0), (6, false, false, [384, 10, 346], [], 14)], 7, 0, E185S18.L6),
([(13, true, false, [218, 394], [10, 208, 384], 0), (6, false, false, [384, 10, 346], [], 20)], 7, 0, E185S18.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E185S18
