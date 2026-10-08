module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S260 "data/lean/d44804fd33816d4f9ddcef38d938578c/E284S260.bin"
namespace E284S260
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [94, 254, 382, 478], [], 6)], 0, E284S260.L1),
([(6, true, false, [94, 254, 382, 478], [], 21)], 0, E284S260.L2),
([(6, true, false, [94, 254, 382, 478], [], 36)], 0, E284S260.L3),
([(6, true, false, [94, 254, 382, 478], [], 37)], 0, E284S260.L4),
([(6, true, false, [94, 254, 382, 478], [], 38)], 0, E284S260.L5),
([(6, true, false, [94, 254, 382, 478], [], 40)], 0, E284S260.L6),
([(6, true, false, [94, 254, 382, 478], [], 42)], 0, E284S260.L7),
([(6, true, false, [94, 254, 382, 478], [], 43)], 0, E284S260.L8),
([(6, true, false, [94, 254, 382, 478], [], 121)], 0, E284S260.L9),
([(6, true, false, [94, 254, 382, 478], [], 128)], 0, E284S260.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E284S260
