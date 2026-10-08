module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E185S33 "data/lean/076b805974d1d4f5ad48ca3922507e76/E185S33.bin"
namespace E185S33
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(7, true, false, [158], [148], 36)], 7, 0, E185S33.L1),
([(7, true, false, [158], [148], 39)], 7, 0, E185S33.L2),
([(7, true, false, [158], [148], 72)], 7, 0, E185S33.L3),
([(7, true, false, [158], [148], 74)], 7, 0, E185S33.L4),
([(7, true, false, [158], [148], 92)], 7, 0, E185S33.L5),
([(7, true, false, [158], [148], 96)], 7, 0, E185S33.L6),
([(7, true, false, [158], [148], 98)], 7, 0, E185S33.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E185S33
