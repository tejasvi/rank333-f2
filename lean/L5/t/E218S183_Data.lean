module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S183 "data/lean/d1a902f62768ff109cc1dace29e50dbb/E218S183.bin"
namespace E218S183
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(1, true, false, [106, 266, 494, 500], [], 6)], 0, E218S183.L1),
([(1, true, false, [106, 266, 494, 500], [], 9)], 0, E218S183.L2),
([(1, true, false, [106, 266, 494, 500], [], 17)], 0, E218S183.L3),
([(1, true, false, [106, 266, 494, 500], [], 29)], 0, E218S183.L4),
([(1, true, false, [106, 266, 494, 500], [], 31)], 0, E218S183.L5),
([(1, true, false, [106, 266, 494, 500], [], 35)], 0, E218S183.L6),
([(1, true, false, [106, 266, 494, 500], [], 54)], 0, E218S183.L7),
([(1, true, false, [106, 266, 494, 500], [], 78)], 0, E218S183.L8),
([(1, true, false, [106, 266, 494, 500], [], 80)], 0, E218S183.L9),
([(1, true, false, [106, 266, 494, 500], [], 88)], 0, E218S183.L10),
([(1, true, false, [106, 266, 494, 500], [], 100)], 0, E218S183.L11),
([(1, true, false, [106, 266, 494, 500], [], 118)], 0, E218S183.L12)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 12
end E218S183
