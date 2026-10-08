module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S405 "data/lean/51b63a19bf80b2f1e57b471ade3c5cea/E236S405.bin"
namespace E236S405
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [354, 394, 254], [96, 136], 10)], 0, E236S405.L1),
([(0, true, false, [354, 394, 254], [96, 136], 11)], 0, E236S405.L2),
([(0, true, false, [354, 394, 254], [96, 136], 20)], 0, E236S405.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E236S405
