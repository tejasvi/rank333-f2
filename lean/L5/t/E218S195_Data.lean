module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S195 "data/lean/0a82258886fe904568c026205288ab44/E218S195.bin"
namespace E218S195
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [142, 254, 494, 500], [], 8)], 0, E218S195.L1),
([(3, true, false, [142, 254, 494, 500], [], 9)], 0, E218S195.L2),
([(3, true, false, [142, 254, 494, 500], [], 10)], 0, E218S195.L3),
([(3, true, false, [142, 254, 494, 500], [], 11)], 0, E218S195.L4),
([(3, true, false, [142, 254, 494, 500], [], 12)], 0, E218S195.L5),
([(3, true, false, [142, 254, 494, 500], [], 13)], 0, E218S195.L6),
([(3, true, false, [142, 254, 494, 500], [], 14)], 0, E218S195.L7),
([(3, true, false, [142, 254, 494, 500], [], 15)], 0, E218S195.L8),
([(3, true, false, [142, 254, 494, 500], [], 16)], 0, E218S195.L9),
([(3, true, false, [142, 254, 494, 500], [], 17)], 0, E218S195.L10),
([(3, true, false, [142, 254, 494, 500], [], 18)], 0, E218S195.L11),
([(3, true, false, [142, 254, 494, 500], [], 19)], 0, E218S195.L12),
([(3, true, false, [142, 254, 494, 500], [], 21)], 0, E218S195.L13),
([(3, true, false, [142, 254, 494, 500], [], 23)], 0, E218S195.L14),
([(3, true, false, [142, 254, 494, 500], [], 24)], 0, E218S195.L15),
([(3, true, false, [142, 254, 494, 500], [], 26)], 0, E218S195.L16),
([(3, true, false, [142, 254, 494, 500], [], 30)], 0, E218S195.L17),
([(3, true, false, [142, 254, 494, 500], [], 40)], 0, E218S195.L18),
([(3, true, false, [142, 254, 494, 500], [], 52)], 0, E218S195.L19),
([(3, true, false, [142, 254, 494, 500], [], 61)], 0, E218S195.L20),
([(3, true, false, [142, 254, 494, 500], [], 72)], 0, E218S195.L21),
([(3, true, false, [142, 254, 494, 500], [], 84)], 0, E218S195.L22),
([(3, true, false, [142, 254, 494, 500], [], 107)], 0, E218S195.L23)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 23
end E218S195
