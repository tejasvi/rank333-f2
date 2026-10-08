module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S124 "data/lean/20e69d333a6d6217ad7745b768174ee6/E213S124.bin"
namespace E213S124
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(14, true, false, [282, 244], [10], 1)], 0, E213S124.L1),
([(14, true, false, [282, 244], [10], 4)], 0, E213S124.L2),
([(14, true, false, [282, 244], [10], 20)], 0, E213S124.L3),
([(14, true, false, [282, 244], [10], 21)], 0, E213S124.L4),
([(14, true, false, [282, 244], [10], 24)], 0, E213S124.L5),
([(14, true, false, [282, 244], [10], 27)], 0, E213S124.L6),
([(14, true, false, [282, 244], [10], 40)], 0, E213S124.L7),
([(14, true, false, [282, 244], [10], 60)], 0, E213S124.L8),
([(14, true, false, [282, 244], [10], 68)], 0, E213S124.L9),
([(14, true, false, [282, 244], [10], 69)], 0, E213S124.L10),
([(14, true, false, [282, 244], [10], 95)], 0, E213S124.L11),
([(14, true, false, [282, 244], [10], 148)], 0, E213S124.L12)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 12
end E213S124
