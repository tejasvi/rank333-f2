module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E202S6 "data/lean/bfeff424a02bad84368a04bc8285afd8/E202S6.bin"
namespace E202S6
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(9, true, false, [282, 426], [272], 42)], 3, 0, E202S6.L1),
([(9, true, false, [282, 426], [272], 80)], 3, 0, E202S6.L2),
([(9, true, false, [282, 426], [272], 86)], 3, 0, E202S6.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E202S6
