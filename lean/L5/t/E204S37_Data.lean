module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E204S37 "data/lean/3bf179fc12becfd02382cac1ec3fa4b4/E204S37.bin"
namespace E204S37
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [266, 372, 426, 468], [], 16)], 0, E204S37.L1),
([(5, true, false, [266, 372, 426, 468], [], 17)], 0, E204S37.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E204S37
