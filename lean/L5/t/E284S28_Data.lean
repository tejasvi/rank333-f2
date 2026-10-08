module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S28 "data/lean/ba7cc8737715ce52f857f573bf92be11/E284S28.bin"
namespace E284S28
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [254, 266, 382, 212], [], 0)], 0, E284S28.L1),
([(8, true, false, [254, 266, 382, 212], [], 1)], 0, E284S28.L2),
([(8, true, false, [254, 266, 382, 212], [], 2)], 0, E284S28.L3),
([(8, true, false, [254, 266, 382, 212], [], 5)], 0, E284S28.L4),
([(8, true, false, [254, 266, 382, 212], [], 15)], 0, E284S28.L5),
([(8, true, false, [254, 266, 382, 212], [], 49)], 0, E284S28.L6),
([(8, true, false, [254, 266, 382, 212], [], 71)], 0, E284S28.L7),
([(8, true, false, [254, 266, 382, 212], [], 72)], 0, E284S28.L8),
([(8, true, false, [254, 266, 382, 212], [], 73)], 0, E284S28.L9),
([(8, true, false, [254, 266, 382, 212], [], 74)], 0, E284S28.L10),
([(8, true, false, [254, 266, 382, 212], [], 81)], 0, E284S28.L11),
([(8, true, false, [254, 266, 382, 212], [], 83)], 0, E284S28.L12),
([(8, true, false, [254, 266, 382, 212], [], 91)], 0, E284S28.L13),
([(8, true, false, [254, 266, 382, 212], [], 92)], 0, E284S28.L14),
([(8, true, false, [254, 266, 382, 212], [], 95)], 0, E284S28.L15),
([(8, true, false, [254, 266, 382, 212], [], 96)], 0, E284S28.L16),
([(8, true, false, [254, 266, 382, 212], [], 103)], 0, E284S28.L17),
([(8, true, false, [254, 266, 382, 212], [], 107)], 0, E284S28.L18),
([(8, true, false, [254, 266, 382, 212], [], 108)], 0, E284S28.L19),
([(8, true, false, [254, 266, 382, 212], [], 109)], 0, E284S28.L20),
([(8, true, false, [254, 266, 382, 212], [], 118)], 0, E284S28.L21),
([(8, true, false, [254, 266, 382, 212], [], 138)], 0, E284S28.L22),
([(8, true, false, [254, 266, 382, 212], [], 159)], 0, E284S28.L23),
([(8, true, false, [254, 266, 382, 212], [], 160)], 0, E284S28.L24),
([(8, true, false, [254, 266, 382, 212], [], 166)], 0, E284S28.L25),
([(8, true, false, [254, 266, 382, 212], [], 181)], 0, E284S28.L26),
([(8, true, false, [254, 266, 382, 212], [], 206)], 0, E284S28.L27),
([(8, true, false, [254, 266, 382, 212], [], 230)], 0, E284S28.L28),
([(8, true, false, [254, 266, 382, 212], [], 243)], 0, E284S28.L29),
([(8, true, false, [254, 266, 382, 212], [], 245)], 0, E284S28.L30)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 30
end E284S28
