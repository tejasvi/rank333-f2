module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S350 "data/lean/3bbb84c05c416b00dcefda02f476df3e/E284S350.bin"
namespace E284S350
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [84, 212, 372, 500], [], 56)], 0, E284S350.L1),
([(13, true, false, [84, 212, 372, 500], [], 67)], 0, E284S350.L2),
([(13, true, false, [84, 212, 372, 500], [], 89)], 0, E284S350.L3),
([(13, true, false, [84, 212, 372, 500], [], 90)], 0, E284S350.L4),
([(13, true, false, [84, 212, 372, 500], [], 93)], 0, E284S350.L5),
([(13, true, false, [84, 212, 372, 500], [], 95)], 0, E284S350.L6),
([(13, true, false, [84, 212, 372, 500], [], 99)], 0, E284S350.L7),
([(13, true, false, [84, 212, 372, 500], [], 107)], 0, E284S350.L8),
([(13, true, false, [84, 212, 372, 500], [], 168)], 0, E284S350.L9),
([(13, true, false, [84, 212, 372, 500], [], 170)], 0, E284S350.L10),
([(13, true, false, [84, 212, 372, 500], [], 190)], 0, E284S350.L11),
([(13, true, false, [84, 212, 372, 500], [], 212)], 0, E284S350.L12)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 12
end E284S350
