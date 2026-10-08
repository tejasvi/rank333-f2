module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S263 "data/lean/4f21428d9cfaadc24f045bdd50ae61ca/E284S263.bin"
namespace E284S263
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [94, 116, 340, 478], [], 0)], 0, E284S263.L1),
([(0, true, false, [94, 116, 340, 478], [], 1)], 0, E284S263.L2),
([(0, true, false, [94, 116, 340, 478], [], 2)], 0, E284S263.L3),
([(0, true, false, [94, 116, 340, 478], [], 4)], 0, E284S263.L4),
([(0, true, false, [94, 116, 340, 478], [], 5)], 0, E284S263.L5),
([(0, true, false, [94, 116, 340, 478], [], 6)], 0, E284S263.L6),
([(0, true, false, [94, 116, 340, 478], [], 70)], 0, E284S263.L7),
([(0, true, false, [94, 116, 340, 478], [], 72)], 0, E284S263.L8),
([(0, true, false, [94, 116, 340, 478], [], 75)], 0, E284S263.L9),
([(0, true, false, [94, 116, 340, 478], [], 76)], 0, E284S263.L10),
([(0, true, false, [94, 116, 340, 478], [], 77)], 0, E284S263.L11),
([(0, true, false, [94, 116, 340, 478], [], 78)], 0, E284S263.L12),
([(0, true, false, [94, 116, 340, 478], [], 83)], 0, E284S263.L13),
([(0, true, false, [94, 116, 340, 478], [], 84)], 0, E284S263.L14),
([(0, true, false, [94, 116, 340, 478], [], 85)], 0, E284S263.L15),
([(0, true, false, [94, 116, 340, 478], [], 99)], 0, E284S263.L16),
([(0, true, false, [94, 116, 340, 478], [], 135)], 0, E284S263.L17),
([(0, true, false, [94, 116, 340, 478], [], 182)], 0, E284S263.L18)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 18
end E284S263
