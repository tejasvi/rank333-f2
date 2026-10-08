module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S153 "data/lean/68047aa52e352fd51daf671cada8415b/E213S153.bin"
namespace E213S153
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [254, 282], [368], 1)], 0, E213S153.L1),
([(8, true, false, [254, 282], [368], 24)], 0, E213S153.L2),
([(8, true, false, [254, 282], [368], 27)], 0, E213S153.L3),
([(8, true, false, [254, 282], [368], 79)], 0, E213S153.L4),
([(8, true, false, [254, 282], [368], 107)], 0, E213S153.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E213S153
