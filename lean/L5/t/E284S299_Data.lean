module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S299 "data/lean/ea0bc72685c666d96c309fa03f5635de/E284S299.bin"
namespace E284S299
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [84, 94, 254, 478, 426], [], 0)], 0, E284S299.L1),
([(0, true, false, [84, 94, 254, 478, 426], [], 1)], 0, E284S299.L2),
([(0, true, false, [84, 94, 254, 478, 426], [], 2)], 0, E284S299.L3),
([(0, true, false, [84, 94, 254, 478, 426], [], 22)], 0, E284S299.L4),
([(0, true, false, [84, 94, 254, 478, 426], [], 23)], 0, E284S299.L5),
([(0, true, false, [84, 94, 254, 478, 426], [], 27)], 0, E284S299.L6),
([(0, true, false, [84, 94, 254, 478, 426], [], 32)], 0, E284S299.L7),
([(0, true, false, [84, 94, 254, 478, 426], [], 33)], 0, E284S299.L8),
([(0, true, false, [84, 94, 254, 478, 426], [], 46)], 0, E284S299.L9),
([(0, true, false, [84, 94, 254, 478, 426], [], 47)], 0, E284S299.L10),
([(0, true, false, [84, 94, 254, 478, 426], [], 51)], 0, E284S299.L11),
([(0, true, false, [84, 94, 254, 478, 426], [], 58)], 0, E284S299.L12),
([(0, true, false, [84, 94, 254, 478, 426], [], 61)], 0, E284S299.L13),
([(0, true, false, [84, 94, 254, 478, 426], [], 73)], 0, E284S299.L14),
([(0, true, false, [84, 94, 254, 478, 426], [], 106)], 0, E284S299.L15),
([(0, true, false, [84, 94, 254, 478, 426], [], 146)], 0, E284S299.L16)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 16
end E284S299
