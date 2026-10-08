module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E159S30 "data/lean/994788f80d99f0cebd985a1770f723d1/E159S30.bin"
namespace E159S30
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(10, true, false, [266, 426, 84, 244], [], 89)], 7, 0, E159S30.L1),
([(10, true, false, [266, 426, 84, 244], [], 152)], 7, 0, E159S30.L2),
([(10, true, false, [266, 426, 84, 244], [], 153)], 7, 0, E159S30.L3),
([(10, true, false, [266, 426, 84, 244], [], 156)], 7, 0, E159S30.L4),
([(10, true, false, [266, 426, 84, 244], [], 157)], 7, 0, E159S30.L5),
([(10, true, false, [266, 426, 84, 244], [], 217)], 7, 0, E159S30.L6),
([(10, true, false, [266, 426, 84, 244], [], 229)], 7, 0, E159S30.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E159S30
