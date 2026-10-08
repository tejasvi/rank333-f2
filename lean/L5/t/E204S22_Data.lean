module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E204S22 "data/lean/14a18ee174ce8c732445f39dadcae80f/E204S22.bin"
namespace E204S22
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [468, 266], [68], 36)], 0, E204S22.L1),
([(4, true, false, [468, 266], [68], 41)], 0, E204S22.L2),
([(4, true, false, [468, 266], [68], 48)], 0, E204S22.L3),
([(4, true, false, [468, 266], [68], 58)], 0, E204S22.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E204S22
