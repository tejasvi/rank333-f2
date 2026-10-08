module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S51 "data/lean/729c1ae34c72aef5a8b2c4b5df50e24a/E213S51.bin"
namespace E213S51
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [254, 494], [96, 368], 0)], 0, E213S51.L1),
([(6, true, false, [254, 494], [96, 368], 19)], 0, E213S51.L2),
([(6, true, false, [254, 494], [96, 368], 21)], 0, E213S51.L3),
([(6, true, false, [254, 494], [96, 368], 24)], 0, E213S51.L4),
([(6, true, false, [254, 494], [96, 368], 32)], 0, E213S51.L5),
([(6, true, false, [254, 494], [96, 368], 74)], 0, E213S51.L6),
([(6, true, false, [254, 494], [96, 368], 76)], 0, E213S51.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E213S51
