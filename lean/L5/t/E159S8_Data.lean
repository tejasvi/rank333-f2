module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E159S8 "data/lean/b8b3808c3acc84bc5eabf9a6e245a69d/E159S8.bin"
namespace E159S8
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(6, true, false, [84, 94, 340], [416], 4)], 8, 0, E159S8.L1),
([(6, true, false, [84, 94, 340], [416], 6)], 8, 0, E159S8.L2),
([(6, true, false, [84, 94, 340], [416], 37)], 8, 0, E159S8.L3),
([(6, true, false, [84, 94, 340], [416], 71)], 8, 0, E159S8.L4),
([(6, true, false, [84, 94, 340], [416], 80)], 8, 0, E159S8.L5),
([(6, true, false, [84, 94, 340], [416], 87)], 8, 0, E159S8.L6),
([(6, true, false, [84, 94, 340], [416], 126)], 8, 0, E159S8.L7),
([(6, true, false, [84, 94, 340], [416], 128)], 8, 0, E159S8.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 8
end E159S8
