module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S331 "data/lean/4c5ed6f77cc78f1fff1ae785753ac738/E284S331.bin"
namespace E284S331
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [94, 340, 468, 84, 212, 478], [], 0)], 0, E284S331.L1),
([(13, true, false, [94, 340, 468, 84, 212, 478], [], 1)], 0, E284S331.L2),
([(13, true, false, [94, 340, 468, 84, 212, 478], [], 2)], 0, E284S331.L3),
([(13, true, false, [94, 340, 468, 84, 212, 478], [], 3)], 0, E284S331.L4),
([(13, true, false, [94, 340, 468, 84, 212, 478], [], 4)], 0, E284S331.L5),
([(13, true, false, [94, 340, 468, 84, 212, 478], [], 5)], 0, E284S331.L6),
([(13, true, false, [94, 340, 468, 84, 212, 478], [], 6)], 0, E284S331.L7),
([(13, true, false, [94, 340, 468, 84, 212, 478], [], 8)], 0, E284S331.L8),
([(13, true, false, [94, 340, 468, 84, 212, 478], [], 10)], 0, E284S331.L9),
([(13, true, false, [94, 340, 468, 84, 212, 478], [], 12)], 0, E284S331.L10),
([(13, true, false, [94, 340, 468, 84, 212, 478], [], 14)], 0, E284S331.L11),
([(13, true, false, [94, 340, 468, 84, 212, 478], [], 15)], 0, E284S331.L12),
([(13, true, false, [94, 340, 468, 84, 212, 478], [], 16)], 0, E284S331.L13),
([(13, true, false, [94, 340, 468, 84, 212, 478], [], 19)], 0, E284S331.L14),
([(13, true, false, [94, 340, 468, 84, 212, 478], [], 24)], 0, E284S331.L15),
([(13, true, false, [94, 340, 468, 84, 212, 478], [], 25)], 0, E284S331.L16),
([(13, true, false, [94, 340, 468, 84, 212, 478], [], 30)], 0, E284S331.L17),
([(13, true, false, [94, 340, 468, 84, 212, 478], [], 32)], 0, E284S331.L18),
([(13, true, false, [94, 340, 468, 84, 212, 478], [], 33)], 0, E284S331.L19),
([(13, true, false, [94, 340, 468, 84, 212, 478], [], 34)], 0, E284S331.L20),
([(13, true, false, [94, 340, 468, 84, 212, 478], [], 35)], 0, E284S331.L21),
([(13, true, false, [94, 340, 468, 84, 212, 478], [], 36)], 0, E284S331.L22),
([(13, true, false, [94, 340, 468, 84, 212, 478], [], 119)], 0, E284S331.L23),
([(13, true, false, [94, 340, 468, 84, 212, 478], [], 161)], 0, E284S331.L24),
([(13, true, false, [94, 340, 468, 84, 212, 478], [], 231)], 0, E284S331.L25)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 25
end E284S331
