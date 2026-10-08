module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E202S15 "data/lean/8802fe57b31eaa571892c158b140d00c/E202S15.bin"
namespace E202S15
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(0, true, false, [254, 426], [10], 1)], 9, 0, E202S15.L1),
([(0, true, false, [254, 426], [10], 2)], 9, 0, E202S15.L2),
([(0, true, false, [254, 426], [10], 10)], 9, 0, E202S15.L3),
([(0, true, false, [254, 426], [10], 12)], 9, 0, E202S15.L4),
([(0, true, false, [254, 426], [10], 13)], 9, 0, E202S15.L5),
([(0, true, false, [254, 426], [10], 30)], 9, 0, E202S15.L6),
([(0, true, false, [254, 426], [10], 34)], 9, 0, E202S15.L7),
([(0, true, false, [254, 426], [10], 47)], 9, 0, E202S15.L8),
([(0, true, false, [254, 426], [10], 58)], 9, 0, E202S15.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E202S15
