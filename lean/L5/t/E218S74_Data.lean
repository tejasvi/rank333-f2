module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S74 "data/lean/f17a108f83adc7388555ec3e83569c56/E218S74.bin"
namespace E218S74
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [106, 500], [112], 0)], 0, E218S74.L1),
([(7, true, false, [106, 500], [112], 1)], 0, E218S74.L2),
([(7, true, false, [106, 500], [112], 4)], 0, E218S74.L3),
([(7, true, false, [106, 500], [112], 11)], 0, E218S74.L4),
([(7, true, false, [106, 500], [112], 21)], 0, E218S74.L5),
([(7, true, false, [106, 500], [112], 35)], 0, E218S74.L6),
([(7, true, false, [106, 500], [112], 57)], 0, E218S74.L7),
([(7, true, false, [106, 500], [112], 77)], 0, E218S74.L8),
([(7, true, false, [106, 500], [112], 88)], 0, E218S74.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E218S74
