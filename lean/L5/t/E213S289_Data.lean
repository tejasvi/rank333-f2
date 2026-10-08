module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S289 "data/lean/145d22f131d868d9de6c2577ce4f4927/E213S289.bin"
namespace E213S289
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(1, true, false, [106, 244, 254, 494], [], 38)], 0, E213S289.L1),
([(1, true, false, [106, 244, 254, 494], [], 41)], 0, E213S289.L2),
([(1, true, false, [106, 244, 254, 494], [], 74)], 0, E213S289.L3),
([(1, true, false, [106, 244, 254, 494], [], 76)], 0, E213S289.L4),
([(1, true, false, [106, 244, 254, 494], [], 105)], 0, E213S289.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E213S289
