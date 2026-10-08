module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E204S17 "data/lean/699cf110ca97ea55f4982c329f1ce251/E204S17.bin"
namespace E204S17
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [334, 468], [400], 2)], 0, E204S17.L1),
([(13, true, false, [334, 468], [400], 8)], 0, E204S17.L2),
([(13, true, false, [334, 468], [400], 64)], 0, E204S17.L3),
([(13, true, false, [334, 468], [400], 65)], 0, E204S17.L4),
([(13, true, false, [334, 468], [400], 99)], 0, E204S17.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E204S17
