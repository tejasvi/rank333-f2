module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S161 "data/lean/83691b9c4184594567b3616d29831efe/E213S161.bin"
namespace E213S161
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [244, 282], [368], 19)], 0, E213S161.L1),
([(8, true, false, [244, 282], [368], 22)], 0, E213S161.L2),
([(8, true, false, [244, 282], [368], 36)], 0, E213S161.L3),
([(8, true, false, [244, 282], [368], 85)], 0, E213S161.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E213S161
