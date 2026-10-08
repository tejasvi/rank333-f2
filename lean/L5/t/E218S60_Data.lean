module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S60 "data/lean/347462c3188dd62bcb0b719d6bf955cd/E218S60.bin"
namespace E218S60
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [106, 142, 266], [148], 5)], 0, E218S60.L1),
([(2, true, false, [106, 142, 266], [148], 7)], 0, E218S60.L2),
([(2, true, false, [106, 142, 266], [148], 30)], 0, E218S60.L3),
([(2, true, false, [106, 142, 266], [148], 32)], 0, E218S60.L4),
([(2, true, false, [106, 142, 266], [148], 33)], 0, E218S60.L5),
([(2, true, false, [106, 142, 266], [148], 46)], 0, E218S60.L6),
([(2, true, false, [106, 142, 266], [148], 52)], 0, E218S60.L7),
([(2, true, false, [106, 142, 266], [148], 57)], 0, E218S60.L8),
([(2, true, false, [106, 142, 266], [148], 68)], 0, E218S60.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E218S60
