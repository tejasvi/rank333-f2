module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E159S14 "data/lean/95d42f17eb4bf665bfac1a9b5ba5a2b2/E159S14.bin"
namespace E159S14
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(4, true, false, [426, 84, 340], [10], 1)], 2, 0, E159S14.L1),
([(4, true, false, [426, 84, 340], [10], 20)], 2, 0, E159S14.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E159S14
