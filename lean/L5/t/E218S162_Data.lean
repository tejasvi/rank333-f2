module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S162 "data/lean/0553eea53eb8bba6c283dbfa507706d5/E218S162.bin"
namespace E218S162
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [106, 142, 254, 494], [], 0)], 0, E218S162.L1),
([(0, true, false, [106, 142, 254, 494], [], 1)], 0, E218S162.L2),
([(0, true, false, [106, 142, 254, 494], [], 7)], 0, E218S162.L3),
([(0, true, false, [106, 142, 254, 494], [], 32)], 0, E218S162.L4),
([(0, true, false, [106, 142, 254, 494], [], 33)], 0, E218S162.L5),
([(0, true, false, [106, 142, 254, 494], [], 34)], 0, E218S162.L6),
([(0, true, false, [106, 142, 254, 494], [], 35)], 0, E218S162.L7),
([(0, true, false, [106, 142, 254, 494], [], 39)], 0, E218S162.L8),
([(0, true, false, [106, 142, 254, 494], [], 47)], 0, E218S162.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E218S162
