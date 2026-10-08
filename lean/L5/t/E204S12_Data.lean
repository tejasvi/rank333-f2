module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E204S12 "data/lean/ce596b37543496499c9f1af483f08a30/E204S12.bin"
namespace E204S12
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [266, 468], [400], 42)], 0, E204S12.L1),
([(13, true, false, [266, 468], [400], 45)], 0, E204S12.L2),
([(13, true, false, [266, 468], [400], 65)], 0, E204S12.L3),
([(13, true, false, [266, 468], [400], 73)], 0, E204S12.L4),
([(13, true, false, [266, 468], [400], 92)], 0, E204S12.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E204S12
