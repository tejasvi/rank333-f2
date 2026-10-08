module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S44 "data/lean/6577ef729004216963d0d33f15f74e94/E218S44.bin"
namespace E218S44
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [254, 494], [414], 36)], 0, E218S44.L1),
([(0, true, false, [254, 494], [414], 37)], 0, E218S44.L2),
([(0, true, false, [254, 494], [414], 43)], 0, E218S44.L3),
([(0, true, false, [254, 494], [414], 44)], 0, E218S44.L4),
([(0, true, false, [254, 494], [414], 96)], 0, E218S44.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E218S44
