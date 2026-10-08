module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E202S14 "data/lean/d510fbb5a85fc68d4d449970b2c73c3f/E202S14.bin"
namespace E202S14
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(9, true, false, [244], [186, 272], 3)], 2, 0, E202S14.L1),
([(9, true, false, [244], [186, 272], 27)], 2, 0, E202S14.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E202S14
