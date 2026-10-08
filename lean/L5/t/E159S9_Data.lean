module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E159S9 "data/lean/37dca53b8162fce2c090f9fdf34e2801/E159S9.bin"
namespace E159S9
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(6, true, false, [84, 266, 340], [416], 33)], 10, 0, E159S9.L1),
([(6, true, false, [84, 266, 340], [416], 68)], 10, 0, E159S9.L2),
([(6, true, false, [84, 266, 340], [416], 79)], 10, 0, E159S9.L3),
([(6, true, false, [84, 266, 340], [416], 83)], 10, 0, E159S9.L4),
([(6, true, false, [84, 266, 340], [416], 88)], 10, 0, E159S9.L5),
([(6, true, false, [84, 266, 340], [416], 90)], 10, 0, E159S9.L6),
([(6, true, false, [84, 266, 340], [416], 109)], 10, 0, E159S9.L7),
([(6, true, false, [84, 266, 340], [416], 126)], 10, 0, E159S9.L8),
([(6, true, false, [84, 266, 340], [416], 127)], 10, 0, E159S9.L9),
([(6, true, false, [84, 266, 340], [416], 134)], 10, 0, E159S9.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E159S9
