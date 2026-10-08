module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S304 "data/lean/17cf04fff007ffebab2d0f4601180511/E284S304.bin"
namespace E284S304
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [84, 212, 298, 426], [], 0)], 0, E284S304.L1),
([(2, true, false, [84, 212, 298, 426], [], 2)], 0, E284S304.L2),
([(2, true, false, [84, 212, 298, 426], [], 5)], 0, E284S304.L3),
([(2, true, false, [84, 212, 298, 426], [], 6)], 0, E284S304.L4),
([(2, true, false, [84, 212, 298, 426], [], 7)], 0, E284S304.L5),
([(2, true, false, [84, 212, 298, 426], [], 8)], 0, E284S304.L6),
([(2, true, false, [84, 212, 298, 426], [], 10)], 0, E284S304.L7),
([(2, true, false, [84, 212, 298, 426], [], 11)], 0, E284S304.L8),
([(2, true, false, [84, 212, 298, 426], [], 12)], 0, E284S304.L9),
([(2, true, false, [84, 212, 298, 426], [], 13)], 0, E284S304.L10),
([(2, true, false, [84, 212, 298, 426], [], 14)], 0, E284S304.L11),
([(2, true, false, [84, 212, 298, 426], [], 15)], 0, E284S304.L12),
([(2, true, false, [84, 212, 298, 426], [], 17)], 0, E284S304.L13)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 13
end E284S304
