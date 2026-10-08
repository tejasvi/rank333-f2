module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S191 "data/lean/a0b5044293d6112972b01c97f072e5c3/E284S191.bin"
namespace E284S191
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [84, 94, 372], [510], 0)], 0, E284S191.L1),
([(0, true, false, [84, 94, 372], [510], 1)], 0, E284S191.L2),
([(0, true, false, [84, 94, 372], [510], 3)], 0, E284S191.L3),
([(0, true, false, [84, 94, 372], [510], 4)], 0, E284S191.L4),
([(0, true, false, [84, 94, 372], [510], 5)], 0, E284S191.L5),
([(0, true, false, [84, 94, 372], [510], 28)], 0, E284S191.L6),
([(0, true, false, [84, 94, 372], [510], 43)], 0, E284S191.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E284S191
