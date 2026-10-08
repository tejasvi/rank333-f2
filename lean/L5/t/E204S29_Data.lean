module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E204S29 "data/lean/300a9aac198270e85ce165591ef5b527/E204S29.bin"
namespace E204S29
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [334, 266], [222], 44)], 0, E204S29.L1),
([(3, true, false, [334, 266], [222], 74)], 0, E204S29.L2),
([(3, true, false, [334, 266], [222], 152)], 0, E204S29.L3),
([(3, true, false, [334, 266], [222], 174)], 0, E204S29.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E204S29
