module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S186 "data/lean/48de3f0f061dc43eec7f6ecd5f6873fe/E213S186.bin"
namespace E213S186
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [158, 244, 282], [368], 2)], 0, E213S186.L1),
([(7, true, false, [158, 244, 282], [368], 13)], 0, E213S186.L2),
([(7, true, false, [158, 244, 282], [368], 15)], 0, E213S186.L3),
([(7, true, false, [158, 244, 282], [368], 44)], 0, E213S186.L4),
([(7, true, false, [158, 244, 282], [368], 47)], 0, E213S186.L5),
([(7, true, false, [158, 244, 282], [368], 54)], 0, E213S186.L6),
([(7, true, false, [158, 244, 282], [368], 73)], 0, E213S186.L7),
([(7, true, false, [158, 244, 282], [368], 78)], 0, E213S186.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 8
end E213S186
