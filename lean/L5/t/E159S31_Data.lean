module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E159S31 "data/lean/d9b98e4eb80e9a882978f9316e9da237/E159S31.bin"
namespace E159S31
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(5, true, false, [94, 254, 266, 426], [], 0)], 9, 0, E159S31.L1),
([(5, true, false, [94, 254, 266, 426], [], 1)], 9, 0, E159S31.L2),
([(5, true, false, [94, 254, 266, 426], [], 3)], 9, 0, E159S31.L3),
([(5, true, false, [94, 254, 266, 426], [], 4)], 9, 0, E159S31.L4),
([(5, true, false, [94, 254, 266, 426], [], 5)], 9, 0, E159S31.L5),
([(5, true, false, [94, 254, 266, 426], [], 24)], 9, 0, E159S31.L6),
([(5, true, false, [94, 254, 266, 426], [], 25)], 9, 0, E159S31.L7),
([(5, true, false, [94, 254, 266, 426], [], 26)], 9, 0, E159S31.L8),
([(5, true, false, [94, 254, 266, 426], [], 51)], 9, 0, E159S31.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E159S31
