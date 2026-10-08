module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S148 "data/lean/1b1c94cb4b3bd06ecafcd32634a58aed/E218S148.bin"
namespace E218S148
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [106, 142, 494], [378], 0)], 0, E218S148.L1),
([(0, true, false, [106, 142, 494], [378], 1)], 0, E218S148.L2),
([(0, true, false, [106, 142, 494], [378], 2)], 0, E218S148.L3),
([(0, true, false, [106, 142, 494], [378], 3)], 0, E218S148.L4),
([(0, true, false, [106, 142, 494], [378], 4)], 0, E218S148.L5),
([(0, true, false, [106, 142, 494], [378], 5)], 0, E218S148.L6),
([(0, true, false, [106, 142, 494], [378], 6)], 0, E218S148.L7),
([(0, true, false, [106, 142, 494], [378], 7)], 0, E218S148.L8),
([(0, true, false, [106, 142, 494], [378], 8)], 0, E218S148.L9),
([(0, true, false, [106, 142, 494], [378], 25)], 0, E218S148.L10),
([(0, true, false, [106, 142, 494], [378], 31)], 0, E218S148.L11),
([(0, true, false, [106, 142, 494], [378], 48)], 0, E218S148.L12),
([(0, true, false, [106, 142, 494], [378], 51)], 0, E218S148.L13),
([(0, true, false, [106, 142, 494], [378], 64)], 0, E218S148.L14),
([(0, true, false, [106, 142, 494], [378], 66)], 0, E218S148.L15)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 15
end E218S148
