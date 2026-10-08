module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S144 "data/lean/63ee360f5f3180e8b7e00a7f163a5c33/E236S144.bin"
namespace E236S144
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [354, 372], [136], 1)], 0, E236S144.L1),
([(0, true, false, [354, 372], [136], 20)], 0, E236S144.L2),
([(0, true, false, [354, 372], [136], 21)], 0, E236S144.L3),
([(0, true, false, [354, 372], [136], 26)], 0, E236S144.L4),
([(0, true, false, [354, 372], [136], 39)], 0, E236S144.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E236S144
