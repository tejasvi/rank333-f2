module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E204S23 "data/lean/13e7a000ca61d7ea7ad1e8d3c0c10815/E204S23.bin"
namespace E204S23
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [468, 334], [68], 2)], 0, E204S23.L1),
([(5, true, false, [468, 334], [68], 38)], 0, E204S23.L2),
([(5, true, false, [468, 334], [68], 92)], 0, E204S23.L3),
([(5, true, false, [468, 334], [68], 94)], 0, E204S23.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E204S23
