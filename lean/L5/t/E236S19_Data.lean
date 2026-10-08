module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S19 "data/lean/ab04afa976e1efb4ea692fc30ee1dae6/E236S19.bin"
namespace E236S19
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [412], [96, 136], 1)], 0, E236S19.L1),
([(0, true, false, [412], [96, 136], 2)], 0, E236S19.L2),
([(0, true, false, [412], [96, 136], 8)], 0, E236S19.L3),
([(0, true, false, [412], [96, 136], 13)], 0, E236S19.L4),
([(0, true, false, [412], [96, 136], 20)], 0, E236S19.L5),
([(0, true, false, [412], [96, 136], 21)], 0, E236S19.L6),
([(0, true, false, [412], [96, 136], 24)], 0, E236S19.L7),
([(0, true, false, [412], [96, 136], 28)], 0, E236S19.L8),
([(0, true, false, [412], [96, 136], 29)], 0, E236S19.L9),
([(0, true, false, [412], [96, 136], 31)], 0, E236S19.L10),
([(0, true, false, [412], [96, 136], 42)], 0, E236S19.L11),
([(0, true, false, [412], [96, 136], 43)], 0, E236S19.L12),
([(0, true, false, [412], [96, 136], 44)], 0, E236S19.L13),
([(0, true, false, [412], [96, 136], 47)], 0, E236S19.L14),
([(0, true, false, [412], [96, 136], 50)], 0, E236S19.L15),
([(0, true, false, [412], [96, 136], 52)], 0, E236S19.L16)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 16
end E236S19
