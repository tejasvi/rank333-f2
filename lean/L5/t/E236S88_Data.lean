module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S88 "data/lean/2207592c3513d05ea4bf1171d70af1cd/E236S88.bin"
namespace E236S88
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [254, 354], [136], 0)], 0, E236S88.L1),
([(2, true, false, [254, 354], [136], 11)], 0, E236S88.L2),
([(2, true, false, [254, 354], [136], 20)], 0, E236S88.L3),
([(2, true, false, [254, 354], [136], 24)], 0, E236S88.L4),
([(2, true, false, [254, 354], [136], 34)], 0, E236S88.L5),
([(2, true, false, [254, 354], [136], 39)], 0, E236S88.L6),
([(2, true, false, [254, 354], [136], 70)], 0, E236S88.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E236S88
