module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E159S1 "data/lean/7f27b491b2861a19b0b91cf975e8cd7f/E159S1.bin"
namespace E159S1
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(16, true, false, [84, 266, 340], [160], 91)], 2, 0, E159S1.L1),
([(16, true, false, [84, 266, 340], [160], 140)], 2, 0, E159S1.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E159S1
