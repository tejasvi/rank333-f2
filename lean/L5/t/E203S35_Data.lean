module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E203S35 "data/lean/0bfbccc1797c272db5a5498b494e3948/E203S35.bin"
namespace E203S35
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(1, true, false, [314, 382, 410, 478], [], 0)], 0, E203S35.L1),
([(1, true, false, [314, 382, 410, 478], [], 1)], 0, E203S35.L2),
([(1, true, false, [314, 382, 410, 478], [], 3)], 0, E203S35.L3),
([(1, true, false, [314, 382, 410, 478], [], 5)], 0, E203S35.L4),
([(1, true, false, [314, 382, 410, 478], [], 6)], 0, E203S35.L5),
([(1, true, false, [314, 382, 410, 478], [], 8)], 0, E203S35.L6),
([(1, true, false, [314, 382, 410, 478], [], 10)], 0, E203S35.L7),
([(1, true, false, [314, 382, 410, 478], [], 12)], 0, E203S35.L8),
([(1, true, false, [314, 382, 410, 478], [], 27)], 0, E203S35.L9),
([(1, true, false, [314, 382, 410, 478], [], 29)], 0, E203S35.L10),
([(1, true, false, [314, 382, 410, 478], [], 30)], 0, E203S35.L11),
([(1, true, false, [314, 382, 410, 478], [], 46)], 0, E203S35.L12),
([(1, true, false, [314, 382, 410, 478], [], 47)], 0, E203S35.L13),
([(1, true, false, [314, 382, 410, 478], [], 48)], 0, E203S35.L14),
([(1, true, false, [314, 382, 410, 478], [], 51)], 0, E203S35.L15),
([(1, true, false, [314, 382, 410, 478], [], 54)], 0, E203S35.L16),
([(1, true, false, [314, 382, 410, 478], [], 73)], 0, E203S35.L17),
([(1, true, false, [314, 382, 410, 478], [], 99)], 0, E203S35.L18),
([(1, true, false, [314, 382, 410, 478], [], 102)], 0, E203S35.L19)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 19
end E203S35
