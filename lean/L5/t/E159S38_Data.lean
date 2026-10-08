module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E159S38 "data/lean/68b075381af2b6f2f3760175ad651220/E159S38.bin"
namespace E159S38
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(0, true, false, [244, 340, 500, 84], [], 6)], 9, 0, E159S38.L1),
([(0, true, false, [244, 340, 500, 84], [], 97)], 9, 0, E159S38.L2),
([(0, true, false, [244, 340, 500, 84], [], 98)], 9, 0, E159S38.L3),
([(0, true, false, [244, 340, 500, 84], [], 101)], 9, 0, E159S38.L4),
([(0, true, false, [244, 340, 500, 84], [], 103)], 9, 0, E159S38.L5),
([(0, true, false, [244, 340, 500, 84], [], 118)], 9, 0, E159S38.L6),
([(0, true, false, [244, 340, 500, 84], [], 148)], 9, 0, E159S38.L7),
([(0, true, false, [244, 340, 500, 84], [], 151)], 9, 0, E159S38.L8),
([(0, true, false, [244, 340, 500, 84], [], 243)], 9, 0, E159S38.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E159S38
