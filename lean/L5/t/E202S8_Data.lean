module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E202S8 "data/lean/1512733e34b8823fe718f9941aecd792/E202S8.bin"
namespace E202S8
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(11, true, false, [426, 494], [176], 21)], 4, 0, E202S8.L1),
([(11, true, false, [426, 494], [176], 22)], 4, 0, E202S8.L2),
([(11, true, false, [426, 494], [176], 24)], 4, 0, E202S8.L3),
([(11, true, false, [426, 494], [176], 61)], 4, 0, E202S8.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E202S8
