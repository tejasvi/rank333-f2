module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S65 "data/lean/5aa3507772d29790f0725c9ef253585d/E218S65.bin"
namespace E218S65
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [142, 266], [272], 0)], 0, E218S65.L1),
([(4, true, false, [142, 266], [272], 3)], 0, E218S65.L2),
([(4, true, false, [142, 266], [272], 4)], 0, E218S65.L3),
([(4, true, false, [142, 266], [272], 6)], 0, E218S65.L4),
([(4, true, false, [142, 266], [272], 12)], 0, E218S65.L5),
([(4, true, false, [142, 266], [272], 14)], 0, E218S65.L6),
([(4, true, false, [142, 266], [272], 24)], 0, E218S65.L7),
([(4, true, false, [142, 266], [272], 25)], 0, E218S65.L8),
([(4, true, false, [142, 266], [272], 28)], 0, E218S65.L9),
([(4, true, false, [142, 266], [272], 30)], 0, E218S65.L10),
([(4, true, false, [142, 266], [272], 31)], 0, E218S65.L11),
([(4, true, false, [142, 266], [272], 32)], 0, E218S65.L12),
([(4, true, false, [142, 266], [272], 39)], 0, E218S65.L13),
([(4, true, false, [142, 266], [272], 40)], 0, E218S65.L14),
([(4, true, false, [142, 266], [272], 42)], 0, E218S65.L15),
([(4, true, false, [142, 266], [272], 43)], 0, E218S65.L16),
([(4, true, false, [142, 266], [272], 44)], 0, E218S65.L17),
([(4, true, false, [142, 266], [272], 45)], 0, E218S65.L18),
([(4, true, false, [142, 266], [272], 46)], 0, E218S65.L19),
([(4, true, false, [142, 266], [272], 49)], 0, E218S65.L20),
([(4, true, false, [142, 266], [272], 50)], 0, E218S65.L21),
([(4, true, false, [142, 266], [272], 51)], 0, E218S65.L22),
([(4, true, false, [142, 266], [272], 68)], 0, E218S65.L23),
([(4, true, false, [142, 266], [272], 104)], 0, E218S65.L24),
([(4, true, false, [142, 266], [272], 118)], 0, E218S65.L25),
([(4, true, false, [142, 266], [272], 119)], 0, E218S65.L26),
([(4, true, false, [142, 266], [272], 141)], 0, E218S65.L27),
([(4, true, false, [142, 266], [272], 171)], 0, E218S65.L28),
([(4, true, false, [142, 266], [272], 172)], 0, E218S65.L29),
([(4, true, false, [142, 266], [272], 180)], 0, E218S65.L30),
([(4, true, false, [142, 266], [272], 252)], 0, E218S65.L31)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 31
end E218S65
