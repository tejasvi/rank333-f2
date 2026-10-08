module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S117 "data/lean/5b03ad9b33ea2b6c5fc52cd1075fa86b/E218S117.bin"
namespace E218S117
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(14, true, false, [26, 352], [], 0), (15, false, false, [106, 388], [], 0)], 0, E218S117.L1),
([(14, true, false, [26, 352], [], 0), (15, false, false, [106, 388], [], 1)], 0, E218S117.L2),
([(14, true, false, [26, 352], [], 0), (15, false, false, [106, 388], [], 2)], 0, E218S117.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E218S117
