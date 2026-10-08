module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S181 "data/lean/90c9733f1f4936ea9655a84e49320649/E236S181.bin"
namespace E236S181
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [354, 158], [490], 4)], 0, E236S181.L1),
([(7, true, false, [354, 158], [490], 6)], 0, E236S181.L2),
([(7, true, false, [354, 158], [490], 14)], 0, E236S181.L3),
([(7, true, false, [354, 158], [490], 19)], 0, E236S181.L4),
([(7, true, false, [354, 158], [490], 42)], 0, E236S181.L5),
([(7, true, false, [354, 158], [490], 75)], 0, E236S181.L6),
([(7, true, false, [354, 158], [490], 81)], 0, E236S181.L7),
([(7, true, false, [354, 158], [490], 89)], 0, E236S181.L8),
([(7, true, false, [354, 158], [490], 119)], 0, E236S181.L9),
([(7, true, false, [354, 158], [490], 128)], 0, E236S181.L10),
([(7, true, false, [354, 158], [490], 152)], 0, E236S181.L11)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 11
end E236S181
