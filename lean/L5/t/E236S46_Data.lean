module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S46 "data/lean/108e48f8833ac41c9bcba9dbd5574eeb/E236S46.bin"
namespace E236S46
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [394, 412], [96], 21)], 0, E236S46.L1),
([(13, true, false, [394, 412], [96], 36)], 0, E236S46.L2),
([(13, true, false, [394, 412], [96], 39)], 0, E236S46.L3),
([(13, true, false, [394, 412], [96], 45)], 0, E236S46.L4),
([(13, true, false, [394, 412], [96], 51)], 0, E236S46.L5),
([(13, true, false, [394, 412], [96], 216)], 0, E236S46.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E236S46
