module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E203S15 "data/lean/3371ebacc79c0c2ce32b6ae31d96534c/E203S15.bin"
namespace E203S15
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(11, true, false, [478, 372], [160], 6)], 0, E203S15.L1),
([(11, true, false, [478, 372], [160], 12)], 0, E203S15.L2),
([(11, true, false, [478, 372], [160], 42)], 0, E203S15.L3),
([(11, true, false, [478, 372], [160], 54)], 0, E203S15.L4),
([(11, true, false, [478, 372], [160], 116)], 0, E203S15.L5),
([(11, true, false, [478, 372], [160], 126)], 0, E203S15.L6),
([(11, true, false, [478, 372], [160], 132)], 0, E203S15.L7),
([(11, true, false, [478, 372], [160], 142)], 0, E203S15.L8),
([(11, true, false, [478, 372], [160], 176)], 0, E203S15.L9),
([(11, true, false, [478, 372], [160], 190)], 0, E203S15.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E203S15
