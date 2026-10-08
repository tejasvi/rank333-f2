module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S416 "data/lean/6f0ed41567965b9d2cbba75744c7cb28/E236S416.bin"
namespace E236S416
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [354, 372, 394, 412], [], 5)], 0, E236S416.L1),
([(0, true, false, [354, 372, 394, 412], [], 7)], 0, E236S416.L2),
([(0, true, false, [354, 372, 394, 412], [], 12)], 0, E236S416.L3),
([(0, true, false, [354, 372, 394, 412], [], 19)], 0, E236S416.L4),
([(0, true, false, [354, 372, 394, 412], [], 27)], 0, E236S416.L5),
([(0, true, false, [354, 372, 394, 412], [], 29)], 0, E236S416.L6),
([(0, true, false, [354, 372, 394, 412], [], 34)], 0, E236S416.L7),
([(0, true, false, [354, 372, 394, 412], [], 39)], 0, E236S416.L8),
([(0, true, false, [354, 372, 394, 412], [], 44)], 0, E236S416.L9),
([(0, true, false, [354, 372, 394, 412], [], 46)], 0, E236S416.L10),
([(0, true, false, [354, 372, 394, 412], [], 49)], 0, E236S416.L11),
([(0, true, false, [354, 372, 394, 412], [], 61)], 0, E236S416.L12),
([(0, true, false, [354, 372, 394, 412], [], 67)], 0, E236S416.L13),
([(0, true, false, [354, 372, 394, 412], [], 73)], 0, E236S416.L14),
([(0, true, false, [354, 372, 394, 412], [], 80)], 0, E236S416.L15),
([(0, true, false, [354, 372, 394, 412], [], 87)], 0, E236S416.L16),
([(0, true, false, [354, 372, 394, 412], [], 94)], 0, E236S416.L17),
([(0, true, false, [354, 372, 394, 412], [], 97)], 0, E236S416.L18),
([(0, true, false, [354, 372, 394, 412], [], 98)], 0, E236S416.L19),
([(0, true, false, [354, 372, 394, 412], [], 99)], 0, E236S416.L20),
([(0, true, false, [354, 372, 394, 412], [], 100)], 0, E236S416.L21),
([(0, true, false, [354, 372, 394, 412], [], 109)], 0, E236S416.L22),
([(0, true, false, [354, 372, 394, 412], [], 113)], 0, E236S416.L23),
([(0, true, false, [354, 372, 394, 412], [], 119)], 0, E236S416.L24),
([(0, true, false, [354, 372, 394, 412], [], 127)], 0, E236S416.L25)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 25
end E236S416
