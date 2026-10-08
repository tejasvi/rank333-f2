module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S279 "data/lean/ddbee6f216fcade55b9f9671cd094fb8/E284S279.bin"
namespace E284S279
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [94, 212, 340, 382], [], 22)], 0, E284S279.L1),
([(0, true, false, [94, 212, 340, 382], [], 23)], 0, E284S279.L2),
([(0, true, false, [94, 212, 340, 382], [], 24)], 0, E284S279.L3),
([(0, true, false, [94, 212, 340, 382], [], 29)], 0, E284S279.L4),
([(0, true, false, [94, 212, 340, 382], [], 32)], 0, E284S279.L5),
([(0, true, false, [94, 212, 340, 382], [], 44)], 0, E284S279.L6),
([(0, true, false, [94, 212, 340, 382], [], 48)], 0, E284S279.L7),
([(0, true, false, [94, 212, 340, 382], [], 49)], 0, E284S279.L8),
([(0, true, false, [94, 212, 340, 382], [], 51)], 0, E284S279.L9),
([(0, true, false, [94, 212, 340, 382], [], 52)], 0, E284S279.L10),
([(0, true, false, [94, 212, 340, 382], [], 73)], 0, E284S279.L11),
([(0, true, false, [94, 212, 340, 382], [], 74)], 0, E284S279.L12),
([(0, true, false, [94, 212, 340, 382], [], 75)], 0, E284S279.L13),
([(0, true, false, [94, 212, 340, 382], [], 76)], 0, E284S279.L14),
([(0, true, false, [94, 212, 340, 382], [], 89)], 0, E284S279.L15),
([(0, true, false, [94, 212, 340, 382], [], 115)], 0, E284S279.L16),
([(0, true, false, [94, 212, 340, 382], [], 116)], 0, E284S279.L17),
([(0, true, false, [94, 212, 340, 382], [], 131)], 0, E284S279.L18)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 18
end E284S279
