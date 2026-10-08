module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S62 "data/lean/26dbd7afa131109390db89b353afd5fc/E213S62.bin"
namespace E213S62
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [106, 244, 494], [368], 2)], 0, E213S62.L1),
([(6, true, false, [106, 244, 494], [368], 12)], 0, E213S62.L2),
([(6, true, false, [106, 244, 494], [368], 16)], 0, E213S62.L3),
([(6, true, false, [106, 244, 494], [368], 32)], 0, E213S62.L4),
([(6, true, false, [106, 244, 494], [368], 33)], 0, E213S62.L5),
([(6, true, false, [106, 244, 494], [368], 44)], 0, E213S62.L6),
([(6, true, false, [106, 244, 494], [368], 45)], 0, E213S62.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E213S62
