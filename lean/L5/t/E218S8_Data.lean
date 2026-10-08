module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S8 "data/lean/e016049e703006d68d21e32837bbc52e/E218S8.bin"
namespace E218S8
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [], [26, 272], 0)], 0, E218S8.L1),
([(4, true, false, [], [26, 272], 4)], 0, E218S8.L2),
([(4, true, false, [], [26, 272], 7)], 0, E218S8.L3),
([(4, true, false, [], [26, 272], 10)], 0, E218S8.L4),
([(4, true, false, [], [26, 272], 11)], 0, E218S8.L5),
([(4, true, false, [], [26, 272], 12)], 0, E218S8.L6),
([(4, true, false, [], [26, 272], 15)], 0, E218S8.L7),
([(4, true, false, [], [26, 272], 19)], 0, E218S8.L8),
([(4, true, false, [], [26, 272], 20)], 0, E218S8.L9),
([(4, true, false, [], [26, 272], 22)], 0, E218S8.L10),
([(4, true, false, [], [26, 272], 25)], 0, E218S8.L11),
([(4, true, false, [], [26, 272], 28)], 0, E218S8.L12),
([(4, true, false, [], [26, 272], 33)], 0, E218S8.L13),
([(4, true, false, [], [26, 272], 37)], 0, E218S8.L14),
([(4, true, false, [], [26, 272], 48)], 0, E218S8.L15),
([(4, true, false, [], [26, 272], 55)], 0, E218S8.L16),
([(4, true, false, [], [26, 272], 59)], 0, E218S8.L17),
([(4, true, false, [], [26, 272], 71)], 0, E218S8.L18),
([(4, true, false, [], [26, 272], 72)], 0, E218S8.L19),
([(4, true, false, [], [26, 272], 73)], 0, E218S8.L20),
([(4, true, false, [], [26, 272], 108)], 0, E218S8.L21),
([(4, true, false, [], [26, 272], 113)], 0, E218S8.L22),
([(4, true, false, [], [26, 272], 116)], 0, E218S8.L23),
([(4, true, false, [], [26, 272], 124)], 0, E218S8.L24),
([(4, true, false, [], [26, 272], 128)], 0, E218S8.L25),
([(4, true, false, [], [26, 272], 131)], 0, E218S8.L26),
([(4, true, false, [], [26, 272], 135)], 0, E218S8.L27),
([(4, true, false, [], [26, 272], 137)], 0, E218S8.L28),
([(4, true, false, [], [26, 272], 165)], 0, E218S8.L29),
([(4, true, false, [], [26, 272], 170)], 0, E218S8.L30)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 30
end E218S8
