module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S194 "data/lean/a9b4fab74277bfe3eaa2afb7e3155073/E218S194.bin"
namespace E218S194
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(1, true, false, [106, 142, 266, 494, 254], [], 0)], 0, E218S194.L1),
([(1, true, false, [106, 142, 266, 494, 254], [], 22)], 0, E218S194.L2),
([(1, true, false, [106, 142, 266, 494, 254], [], 24)], 0, E218S194.L3),
([(1, true, false, [106, 142, 266, 494, 254], [], 46)], 0, E218S194.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E218S194
