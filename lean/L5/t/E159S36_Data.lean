module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E159S36 "data/lean/64e296fb1c7e9a36e44c0368540573b2/E159S36.bin"
namespace E159S36
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(4, true, false, [84, 94, 254, 266, 426], [], 4)], 10, 0, E159S36.L1),
([(4, true, false, [84, 94, 254, 266, 426], [], 6)], 10, 0, E159S36.L2),
([(4, true, false, [84, 94, 254, 266, 426], [], 8)], 10, 0, E159S36.L3),
([(4, true, false, [84, 94, 254, 266, 426], [], 9)], 10, 0, E159S36.L4),
([(4, true, false, [84, 94, 254, 266, 426], [], 10)], 10, 0, E159S36.L5),
([(4, true, false, [84, 94, 254, 266, 426], [], 11)], 10, 0, E159S36.L6),
([(4, true, false, [84, 94, 254, 266, 426], [], 12)], 10, 0, E159S36.L7),
([(4, true, false, [84, 94, 254, 266, 426], [], 14)], 10, 0, E159S36.L8),
([(4, true, false, [84, 94, 254, 266, 426], [], 16)], 10, 0, E159S36.L9),
([(4, true, false, [84, 94, 254, 266, 426], [], 17)], 10, 0, E159S36.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E159S36
