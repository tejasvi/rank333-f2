module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S300 "data/lean/ee42e2227b60cb3a2adb620a5b9ebd70/E284S300.bin"
namespace E284S300
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [84, 94, 254, 382, 426], [], 0)], 0, E284S300.L1),
([(0, true, false, [84, 94, 254, 382, 426], [], 1)], 0, E284S300.L2),
([(0, true, false, [84, 94, 254, 382, 426], [], 2)], 0, E284S300.L3),
([(0, true, false, [84, 94, 254, 382, 426], [], 6)], 0, E284S300.L4),
([(0, true, false, [84, 94, 254, 382, 426], [], 29)], 0, E284S300.L5),
([(0, true, false, [84, 94, 254, 382, 426], [], 48)], 0, E284S300.L6),
([(0, true, false, [84, 94, 254, 382, 426], [], 49)], 0, E284S300.L7),
([(0, true, false, [84, 94, 254, 382, 426], [], 55)], 0, E284S300.L8),
([(0, true, false, [84, 94, 254, 382, 426], [], 57)], 0, E284S300.L9),
([(0, true, false, [84, 94, 254, 382, 426], [], 58)], 0, E284S300.L10),
([(0, true, false, [84, 94, 254, 382, 426], [], 63)], 0, E284S300.L11),
([(0, true, false, [84, 94, 254, 382, 426], [], 81)], 0, E284S300.L12),
([(0, true, false, [84, 94, 254, 382, 426], [], 82)], 0, E284S300.L13),
([(0, true, false, [84, 94, 254, 382, 426], [], 89)], 0, E284S300.L14),
([(0, true, false, [84, 94, 254, 382, 426], [], 116)], 0, E284S300.L15),
([(0, true, false, [84, 94, 254, 382, 426], [], 119)], 0, E284S300.L16)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 16
end E284S300
