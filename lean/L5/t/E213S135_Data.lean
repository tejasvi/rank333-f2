module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S135 "data/lean/5d10174da06f6860d343bcc09b004bd7/E213S135.bin"
namespace E213S135
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [106, 282, 494], [], 0)], 0, E213S135.L1),
([(0, true, false, [106, 282, 494], [], 6)], 0, E213S135.L2),
([(0, true, false, [106, 282, 494], [], 9)], 0, E213S135.L3),
([(0, true, false, [106, 282, 494], [], 49)], 0, E213S135.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E213S135
