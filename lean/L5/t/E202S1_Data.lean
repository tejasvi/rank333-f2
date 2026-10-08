module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E202S1 "data/lean/aac5745451e5b05b17ae1e39c0d6a0d3/E202S1.bin"
namespace E202S1
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(6, true, false, [426, 282], [272], 42)], 8, 0, E202S1.L1),
([(6, true, false, [426, 282], [272], 43)], 8, 0, E202S1.L2),
([(6, true, false, [426, 282], [272], 48)], 8, 0, E202S1.L3),
([(6, true, false, [426, 282], [272], 78)], 8, 0, E202S1.L4),
([(6, true, false, [426, 282], [272], 85)], 8, 0, E202S1.L5),
([(6, true, false, [426, 282], [272], 86)], 8, 0, E202S1.L6),
([(6, true, false, [426, 282], [272], 109)], 8, 0, E202S1.L7),
([(6, true, false, [426, 282], [272], 119)], 8, 0, E202S1.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 8
end E202S1
