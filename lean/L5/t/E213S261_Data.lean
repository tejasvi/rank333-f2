module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S261 "data/lean/124bcba565c99fd0c5f5e72a7a5cb655/E213S261.bin"
namespace E213S261
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(16, true, false, [106, 244, 254], [96], 0)], 0, E213S261.L1),
([(16, true, false, [106, 244, 254], [96], 2)], 0, E213S261.L2),
([(16, true, false, [106, 244, 254], [96], 36)], 0, E213S261.L3),
([(16, true, false, [106, 244, 254], [96], 48)], 0, E213S261.L4),
([(16, true, false, [106, 244, 254], [96], 56)], 0, E213S261.L5),
([(16, true, false, [106, 244, 254], [96], 165)], 0, E213S261.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E213S261
