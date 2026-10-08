module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S29 "data/lean/f274cf8e5f14d09f88a85498fd618b23/E284S29.bin"
namespace E284S29
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [94, 266, 382, 212], [], 0)], 0, E284S29.L1),
([(8, true, false, [94, 266, 382, 212], [], 1)], 0, E284S29.L2),
([(8, true, false, [94, 266, 382, 212], [], 2)], 0, E284S29.L3),
([(8, true, false, [94, 266, 382, 212], [], 3)], 0, E284S29.L4),
([(8, true, false, [94, 266, 382, 212], [], 4)], 0, E284S29.L5),
([(8, true, false, [94, 266, 382, 212], [], 5)], 0, E284S29.L6),
([(8, true, false, [94, 266, 382, 212], [], 6)], 0, E284S29.L7),
([(8, true, false, [94, 266, 382, 212], [], 7)], 0, E284S29.L8),
([(8, true, false, [94, 266, 382, 212], [], 8)], 0, E284S29.L9),
([(8, true, false, [94, 266, 382, 212], [], 9)], 0, E284S29.L10),
([(8, true, false, [94, 266, 382, 212], [], 10)], 0, E284S29.L11),
([(8, true, false, [94, 266, 382, 212], [], 11)], 0, E284S29.L12),
([(8, true, false, [94, 266, 382, 212], [], 12)], 0, E284S29.L13),
([(8, true, false, [94, 266, 382, 212], [], 13)], 0, E284S29.L14),
([(8, true, false, [94, 266, 382, 212], [], 14)], 0, E284S29.L15),
([(8, true, false, [94, 266, 382, 212], [], 15)], 0, E284S29.L16),
([(8, true, false, [94, 266, 382, 212], [], 18)], 0, E284S29.L17),
([(8, true, false, [94, 266, 382, 212], [], 20)], 0, E284S29.L18),
([(8, true, false, [94, 266, 382, 212], [], 21)], 0, E284S29.L19),
([(8, true, false, [94, 266, 382, 212], [], 25)], 0, E284S29.L20),
([(8, true, false, [94, 266, 382, 212], [], 26)], 0, E284S29.L21),
([(8, true, false, [94, 266, 382, 212], [], 27)], 0, E284S29.L22),
([(8, true, false, [94, 266, 382, 212], [], 34)], 0, E284S29.L23),
([(8, true, false, [94, 266, 382, 212], [], 38)], 0, E284S29.L24),
([(8, true, false, [94, 266, 382, 212], [], 39)], 0, E284S29.L25),
([(8, true, false, [94, 266, 382, 212], [], 40)], 0, E284S29.L26),
([(8, true, false, [94, 266, 382, 212], [], 43)], 0, E284S29.L27),
([(8, true, false, [94, 266, 382, 212], [], 84)], 0, E284S29.L28),
([(8, true, false, [94, 266, 382, 212], [], 89)], 0, E284S29.L29),
([(8, true, false, [94, 266, 382, 212], [], 94)], 0, E284S29.L30)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 30
end E284S29
