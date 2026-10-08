module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S368 "data/lean/01807c17da3e0e3acf759226ac82135f/E236S368.bin"
namespace E236S368
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [394, 412], [136], 0)], 0, E236S368.L1),
([(0, true, false, [394, 412], [136], 6)], 0, E236S368.L2),
([(0, true, false, [394, 412], [136], 75)], 0, E236S368.L3),
([(0, true, false, [394, 412], [136], 120)], 0, E236S368.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E236S368
