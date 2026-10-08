module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S95 "data/lean/ee954bb545fc28ac345942d88a546056/E236S95.bin"
namespace E236S95
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(15, true, false, [354, 394], [22], 5)], 0, E236S95.L1),
([(15, true, false, [354, 394], [22], 8)], 0, E236S95.L2),
([(15, true, false, [354, 394], [22], 42)], 0, E236S95.L3),
([(15, true, false, [354, 394], [22], 44)], 0, E236S95.L4),
([(15, true, false, [354, 394], [22], 54)], 0, E236S95.L5),
([(15, true, false, [354, 394], [22], 74)], 0, E236S95.L6),
([(15, true, false, [354, 394], [22], 81)], 0, E236S95.L7),
([(15, true, false, [354, 394], [22], 112)], 0, E236S95.L8),
([(15, true, false, [354, 394], [22], 114)], 0, E236S95.L9),
([(15, true, false, [354, 394], [22], 124)], 0, E236S95.L10),
([(15, true, false, [354, 394], [22], 138)], 0, E236S95.L11)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 11
end E236S95
