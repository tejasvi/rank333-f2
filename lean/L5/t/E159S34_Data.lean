module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E159S34 "data/lean/3fdda28f17c3dcb75752942868d08a3c/E159S34.bin"
namespace E159S34
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(4, true, false, [94, 254, 266, 426], [], 0)], 21, 0, E159S34.L1),
([(4, true, false, [94, 254, 266, 426], [], 1)], 21, 0, E159S34.L2),
([(4, true, false, [94, 254, 266, 426], [], 2)], 21, 0, E159S34.L3),
([(4, true, false, [94, 254, 266, 426], [], 3)], 21, 0, E159S34.L4),
([(4, true, false, [94, 254, 266, 426], [], 4)], 21, 0, E159S34.L5),
([(4, true, false, [94, 254, 266, 426], [], 5)], 21, 0, E159S34.L6),
([(4, true, false, [94, 254, 266, 426], [], 11)], 21, 0, E159S34.L7),
([(4, true, false, [94, 254, 266, 426], [], 23)], 21, 0, E159S34.L8),
([(4, true, false, [94, 254, 266, 426], [], 24)], 21, 0, E159S34.L9),
([(4, true, false, [94, 254, 266, 426], [], 25)], 21, 0, E159S34.L10),
([(4, true, false, [94, 254, 266, 426], [], 26)], 21, 0, E159S34.L11),
([(4, true, false, [94, 254, 266, 426], [], 27)], 21, 0, E159S34.L12),
([(4, true, false, [94, 254, 266, 426], [], 28)], 21, 0, E159S34.L13),
([(4, true, false, [94, 254, 266, 426], [], 30)], 21, 0, E159S34.L14),
([(4, true, false, [94, 254, 266, 426], [], 31)], 21, 0, E159S34.L15),
([(4, true, false, [94, 254, 266, 426], [], 32)], 21, 0, E159S34.L16),
([(4, true, false, [94, 254, 266, 426], [], 33)], 21, 0, E159S34.L17),
([(4, true, false, [94, 254, 266, 426], [], 40)], 21, 0, E159S34.L18),
([(4, true, false, [94, 254, 266, 426], [], 51)], 21, 0, E159S34.L19),
([(4, true, false, [94, 254, 266, 426], [], 52)], 21, 0, E159S34.L20),
([(4, true, false, [94, 254, 266, 426], [], 54)], 21, 0, E159S34.L21)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 21
end E159S34
