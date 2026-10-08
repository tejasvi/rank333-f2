module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S264 "data/lean/0db8287e6815eeb30b941a5d051bbbf6/E284S264.bin"
namespace E284S264
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [84, 116, 478], [138], 3)], 0, E284S264.L1),
([(2, true, false, [84, 116, 478], [138], 11)], 0, E284S264.L2),
([(2, true, false, [84, 116, 478], [138], 30)], 0, E284S264.L3),
([(2, true, false, [84, 116, 478], [138], 31)], 0, E284S264.L4),
([(2, true, false, [84, 116, 478], [138], 37)], 0, E284S264.L5),
([(2, true, false, [84, 116, 478], [138], 44)], 0, E284S264.L6),
([(2, true, false, [84, 116, 478], [138], 54)], 0, E284S264.L7),
([(2, true, false, [84, 116, 478], [138], 75)], 0, E284S264.L8),
([(2, true, false, [84, 116, 478], [138], 87)], 0, E284S264.L9),
([(2, true, false, [84, 116, 478], [138], 89)], 0, E284S264.L10),
([(2, true, false, [84, 116, 478], [138], 90)], 0, E284S264.L11),
([(2, true, false, [84, 116, 478], [138], 125)], 0, E284S264.L12),
([(2, true, false, [84, 116, 478], [138], 131)], 0, E284S264.L13),
([(2, true, false, [84, 116, 478], [138], 133)], 0, E284S264.L14),
([(2, true, false, [84, 116, 478], [138], 151)], 0, E284S264.L15)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 15
end E284S264
