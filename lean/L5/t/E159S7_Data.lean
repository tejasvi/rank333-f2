module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E159S7 "data/lean/b2e0fbb88731c68fca4456748292b8cc/E159S7.bin"
namespace E159S7
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(0, true, false, [84, 94, 500, 266], [], 0)], 21, 0, E159S7.L1),
([(0, true, false, [84, 94, 500, 266], [], 7)], 21, 0, E159S7.L2),
([(0, true, false, [84, 94, 500, 266], [], 15)], 21, 0, E159S7.L3),
([(0, true, false, [84, 94, 500, 266], [], 16)], 21, 0, E159S7.L4),
([(0, true, false, [84, 94, 500, 266], [], 17)], 21, 0, E159S7.L5),
([(0, true, false, [84, 94, 500, 266], [], 18)], 21, 0, E159S7.L6),
([(0, true, false, [84, 94, 500, 266], [], 19)], 21, 0, E159S7.L7),
([(0, true, false, [84, 94, 500, 266], [], 23)], 21, 0, E159S7.L8),
([(0, true, false, [84, 94, 500, 266], [], 44)], 21, 0, E159S7.L9),
([(0, true, false, [84, 94, 500, 266], [], 45)], 21, 0, E159S7.L10),
([(0, true, false, [84, 94, 500, 266], [], 46)], 21, 0, E159S7.L11),
([(0, true, false, [84, 94, 500, 266], [], 51)], 21, 0, E159S7.L12),
([(0, true, false, [84, 94, 500, 266], [], 85)], 21, 0, E159S7.L13),
([(0, true, false, [84, 94, 500, 266], [], 94)], 21, 0, E159S7.L14),
([(0, true, false, [84, 94, 500, 266], [], 95)], 21, 0, E159S7.L15),
([(0, true, false, [84, 94, 500, 266], [], 158)], 21, 0, E159S7.L16),
([(0, true, false, [84, 94, 500, 266], [], 180)], 21, 0, E159S7.L17),
([(0, true, false, [84, 94, 500, 266], [], 183)], 21, 0, E159S7.L18),
([(0, true, false, [84, 94, 500, 266], [], 186)], 21, 0, E159S7.L19),
([(0, true, false, [84, 94, 500, 266], [], 198)], 21, 0, E159S7.L20),
([(0, true, false, [84, 94, 500, 266], [], 226)], 21, 0, E159S7.L21)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 21
end E159S7
