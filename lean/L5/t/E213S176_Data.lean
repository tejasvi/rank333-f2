module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S176 "data/lean/3fae03127a601bbbba7b42c24064c1a4/E213S176.bin"
namespace E213S176
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [282, 494], [272, 368], 7)], 0, E213S176.L1),
([(7, true, false, [282, 494], [272, 368], 25)], 0, E213S176.L2),
([(7, true, false, [282, 494], [272, 368], 26)], 0, E213S176.L3),
([(7, true, false, [282, 494], [272, 368], 45)], 0, E213S176.L4),
([(7, true, false, [282, 494], [272, 368], 119)], 0, E213S176.L5),
([(7, true, false, [282, 494], [272, 368], 125)], 0, E213S176.L6),
([(7, true, false, [282, 494], [272, 368], 126)], 0, E213S176.L7),
([(7, true, false, [282, 494], [272, 368], 129)], 0, E213S176.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 8
end E213S176
