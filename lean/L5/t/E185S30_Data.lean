module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E185S30 "data/lean/0ff22d226773bccd0167e92851f29726/E185S30.bin"
namespace E185S30
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(0, true, false, [346], [10], 1)], 12, 0, E185S30.L1),
([(0, true, false, [346], [10], 3)], 12, 0, E185S30.L2),
([(0, true, false, [346], [10], 4)], 12, 0, E185S30.L3),
([(0, true, false, [346], [10], 6)], 12, 0, E185S30.L4),
([(0, true, false, [346], [10], 11)], 12, 0, E185S30.L5),
([(0, true, false, [346], [10], 13)], 12, 0, E185S30.L6),
([(0, true, false, [346], [10], 40)], 12, 0, E185S30.L7),
([(0, true, false, [346], [10], 42)], 12, 0, E185S30.L8),
([(0, true, false, [346], [10], 68)], 12, 0, E185S30.L9),
([(0, true, false, [346], [10], 69)], 12, 0, E185S30.L10),
([(0, true, false, [346], [10], 84)], 12, 0, E185S30.L11),
([(0, true, false, [346], [10], 87)], 12, 0, E185S30.L12)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 12
end E185S30
