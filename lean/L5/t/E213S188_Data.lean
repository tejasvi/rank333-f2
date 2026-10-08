module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S188 "data/lean/c8f28f9b550bedc04ac449f2e22aa7bb/E213S188.bin"
namespace E213S188
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [106, 244, 254], [96], 0)], 0, E213S188.L1),
([(2, true, false, [106, 244, 254], [96], 4)], 0, E213S188.L2),
([(2, true, false, [106, 244, 254], [96], 9)], 0, E213S188.L3),
([(2, true, false, [106, 244, 254], [96], 12)], 0, E213S188.L4),
([(2, true, false, [106, 244, 254], [96], 13)], 0, E213S188.L5),
([(2, true, false, [106, 244, 254], [96], 24)], 0, E213S188.L6),
([(2, true, false, [106, 244, 254], [96], 55)], 0, E213S188.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E213S188
