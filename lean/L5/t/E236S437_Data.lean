module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S437 "data/lean/329e3ee3ab91e07a805b0a1414d1b8d7/E236S437.bin"
namespace E236S437
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [158, 394, 372], [22], 5)], 0, E236S437.L1),
([(2, true, false, [158, 394, 372], [22], 23)], 0, E236S437.L2),
([(2, true, false, [158, 394, 372], [22], 30)], 0, E236S437.L3),
([(2, true, false, [158, 394, 372], [22], 61)], 0, E236S437.L4),
([(2, true, false, [158, 394, 372], [22], 62)], 0, E236S437.L5),
([(2, true, false, [158, 394, 372], [22], 65)], 0, E236S437.L6),
([(2, true, false, [158, 394, 372], [22], 66)], 0, E236S437.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E236S437
