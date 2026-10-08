module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S349 "data/lean/2aefb219ba0acbaffce953fd9dadf510/E284S349.bin"
namespace E284S349
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(17, true, false, [84, 116, 468, 500], [], 0)], 0, E284S349.L1),
([(17, true, false, [84, 116, 468, 500], [], 5)], 0, E284S349.L2),
([(17, true, false, [84, 116, 468, 500], [], 6)], 0, E284S349.L3),
([(17, true, false, [84, 116, 468, 500], [], 9)], 0, E284S349.L4),
([(17, true, false, [84, 116, 468, 500], [], 11)], 0, E284S349.L5),
([(17, true, false, [84, 116, 468, 500], [], 22)], 0, E284S349.L6),
([(17, true, false, [84, 116, 468, 500], [], 65)], 0, E284S349.L7),
([(17, true, false, [84, 116, 468, 500], [], 99)], 0, E284S349.L8),
([(17, true, false, [84, 116, 468, 500], [], 106)], 0, E284S349.L9),
([(17, true, false, [84, 116, 468, 500], [], 107)], 0, E284S349.L10),
([(17, true, false, [84, 116, 468, 500], [], 170)], 0, E284S349.L11),
([(17, true, false, [84, 116, 468, 500], [], 190)], 0, E284S349.L12)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 12
end E284S349
