module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S343 "data/lean/636826d534a4a94c33fa48b70d1703e5/E284S343.bin"
namespace E284S343
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [372, 500, 84, 212], [], 0)], 0, E284S343.L1),
([(8, true, false, [372, 500, 84, 212], [], 7)], 0, E284S343.L2),
([(8, true, false, [372, 500, 84, 212], [], 13)], 0, E284S343.L3),
([(8, true, false, [372, 500, 84, 212], [], 21)], 0, E284S343.L4),
([(8, true, false, [372, 500, 84, 212], [], 30)], 0, E284S343.L5),
([(8, true, false, [372, 500, 84, 212], [], 32)], 0, E284S343.L6),
([(8, true, false, [372, 500, 84, 212], [], 36)], 0, E284S343.L7),
([(8, true, false, [372, 500, 84, 212], [], 37)], 0, E284S343.L8),
([(8, true, false, [372, 500, 84, 212], [], 39)], 0, E284S343.L9),
([(8, true, false, [372, 500, 84, 212], [], 43)], 0, E284S343.L10),
([(8, true, false, [372, 500, 84, 212], [], 44)], 0, E284S343.L11),
([(8, true, false, [372, 500, 84, 212], [], 45)], 0, E284S343.L12),
([(8, true, false, [372, 500, 84, 212], [], 85)], 0, E284S343.L13),
([(8, true, false, [372, 500, 84, 212], [], 86)], 0, E284S343.L14)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 14
end E284S343
