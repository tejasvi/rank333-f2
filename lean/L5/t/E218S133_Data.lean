module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S133 "data/lean/d6517bd9cd45062ed9b5b389cfbd86a0/E218S133.bin"
namespace E218S133
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [106, 266, 494], [378], 2)], 0, E218S133.L1),
([(0, true, false, [106, 266, 494], [378], 3)], 0, E218S133.L2),
([(0, true, false, [106, 266, 494], [378], 4)], 0, E218S133.L3),
([(0, true, false, [106, 266, 494], [378], 6)], 0, E218S133.L4),
([(0, true, false, [106, 266, 494], [378], 7)], 0, E218S133.L5),
([(0, true, false, [106, 266, 494], [378], 9)], 0, E218S133.L6),
([(0, true, false, [106, 266, 494], [378], 10)], 0, E218S133.L7),
([(0, true, false, [106, 266, 494], [378], 12)], 0, E218S133.L8),
([(0, true, false, [106, 266, 494], [378], 22)], 0, E218S133.L9),
([(0, true, false, [106, 266, 494], [378], 23)], 0, E218S133.L10),
([(0, true, false, [106, 266, 494], [378], 24)], 0, E218S133.L11),
([(0, true, false, [106, 266, 494], [378], 26)], 0, E218S133.L12),
([(0, true, false, [106, 266, 494], [378], 29)], 0, E218S133.L13),
([(0, true, false, [106, 266, 494], [378], 43)], 0, E218S133.L14),
([(0, true, false, [106, 266, 494], [378], 45)], 0, E218S133.L15),
([(0, true, false, [106, 266, 494], [378], 47)], 0, E218S133.L16),
([(0, true, false, [106, 266, 494], [378], 59)], 0, E218S133.L17),
([(0, true, false, [106, 266, 494], [378], 66)], 0, E218S133.L18),
([(0, true, false, [106, 266, 494], [378], 70)], 0, E218S133.L19),
([(0, true, false, [106, 266, 494], [378], 71)], 0, E218S133.L20),
([(0, true, false, [106, 266, 494], [378], 75)], 0, E218S133.L21)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 21
end E218S133
