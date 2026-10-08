module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S4 "data/lean/2c58b236932561ba30f2b613b5d74514/E218S4.bin"
namespace E218S4
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [254, 500], [112], 12)], 0, E218S4.L1),
([(8, true, false, [254, 500], [112], 13)], 0, E218S4.L2),
([(8, true, false, [254, 500], [112], 24)], 0, E218S4.L3),
([(8, true, false, [254, 500], [112], 29)], 0, E218S4.L4),
([(8, true, false, [254, 500], [112], 115)], 0, E218S4.L5),
([(8, true, false, [254, 500], [112], 117)], 0, E218S4.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E218S4
