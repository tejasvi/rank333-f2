module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S281 "data/lean/8d20a0cf913785b011a4476e56f70ee1/E236S281.bin"
namespace E236S281
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [158, 354], [136], 0)], 0, E236S281.L1),
([(2, true, false, [158, 354], [136], 12)], 0, E236S281.L2),
([(2, true, false, [158, 354], [136], 44)], 0, E236S281.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E236S281
