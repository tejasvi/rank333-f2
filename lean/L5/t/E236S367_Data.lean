module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S367 "data/lean/752bd8cc550747cb45753d2ad964d80f/E236S367.bin"
namespace E236S367
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [412], [96, 136], 2)], 0, E236S367.L1),
([(0, true, false, [412], [96, 136], 8)], 0, E236S367.L2),
([(0, true, false, [412], [96, 136], 43)], 0, E236S367.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E236S367
