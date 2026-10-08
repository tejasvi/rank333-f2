module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S48 "data/lean/7a55b489f2923fb547786599b10e7890/E236S48.bin"
namespace E236S48
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [354, 372, 394, 412], [], 5)], 0, E236S48.L1),
([(0, true, false, [354, 372, 394, 412], [], 7)], 0, E236S48.L2),
([(0, true, false, [354, 372, 394, 412], [], 12)], 0, E236S48.L3),
([(0, true, false, [354, 372, 394, 412], [], 13)], 0, E236S48.L4),
([(0, true, false, [354, 372, 394, 412], [], 19)], 0, E236S48.L5),
([(0, true, false, [354, 372, 394, 412], [], 22)], 0, E236S48.L6),
([(0, true, false, [354, 372, 394, 412], [], 23)], 0, E236S48.L7),
([(0, true, false, [354, 372, 394, 412], [], 24)], 0, E236S48.L8),
([(0, true, false, [354, 372, 394, 412], [], 27)], 0, E236S48.L9),
([(0, true, false, [354, 372, 394, 412], [], 28)], 0, E236S48.L10),
([(0, true, false, [354, 372, 394, 412], [], 29)], 0, E236S48.L11),
([(0, true, false, [354, 372, 394, 412], [], 30)], 0, E236S48.L12),
([(0, true, false, [354, 372, 394, 412], [], 31)], 0, E236S48.L13),
([(0, true, false, [354, 372, 394, 412], [], 32)], 0, E236S48.L14),
([(0, true, false, [354, 372, 394, 412], [], 34)], 0, E236S48.L15),
([(0, true, false, [354, 372, 394, 412], [], 39)], 0, E236S48.L16),
([(0, true, false, [354, 372, 394, 412], [], 44)], 0, E236S48.L17),
([(0, true, false, [354, 372, 394, 412], [], 45)], 0, E236S48.L18),
([(0, true, false, [354, 372, 394, 412], [], 46)], 0, E236S48.L19),
([(0, true, false, [354, 372, 394, 412], [], 47)], 0, E236S48.L20),
([(0, true, false, [354, 372, 394, 412], [], 48)], 0, E236S48.L21),
([(0, true, false, [354, 372, 394, 412], [], 49)], 0, E236S48.L22),
([(0, true, false, [354, 372, 394, 412], [], 56)], 0, E236S48.L23),
([(0, true, false, [354, 372, 394, 412], [], 59)], 0, E236S48.L24),
([(0, true, false, [354, 372, 394, 412], [], 61)], 0, E236S48.L25),
([(0, true, false, [354, 372, 394, 412], [], 73)], 0, E236S48.L26),
([(0, true, false, [354, 372, 394, 412], [], 80)], 0, E236S48.L27),
([(0, true, false, [354, 372, 394, 412], [], 85)], 0, E236S48.L28),
([(0, true, false, [354, 372, 394, 412], [], 87)], 0, E236S48.L29),
([(0, true, false, [354, 372, 394, 412], [], 94)], 0, E236S48.L30),
([(0, true, false, [354, 372, 394, 412], [], 97)], 0, E236S48.L31),
([(0, true, false, [354, 372, 394, 412], [], 98)], 0, E236S48.L32),
([(0, true, false, [354, 372, 394, 412], [], 99)], 0, E236S48.L33),
([(0, true, false, [354, 372, 394, 412], [], 100)], 0, E236S48.L34),
([(0, true, false, [354, 372, 394, 412], [], 105)], 0, E236S48.L35),
([(0, true, false, [354, 372, 394, 412], [], 106)], 0, E236S48.L36),
([(0, true, false, [354, 372, 394, 412], [], 107)], 0, E236S48.L37),
([(0, true, false, [354, 372, 394, 412], [], 109)], 0, E236S48.L38),
([(0, true, false, [354, 372, 394, 412], [], 111)], 0, E236S48.L39),
([(0, true, false, [354, 372, 394, 412], [], 113)], 0, E236S48.L40),
([(0, true, false, [354, 372, 394, 412], [], 119)], 0, E236S48.L41),
([(0, true, false, [354, 372, 394, 412], [], 127)], 0, E236S48.L42),
([(0, true, false, [354, 372, 394, 412], [], 137)], 0, E236S48.L43)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 43
end E236S48
