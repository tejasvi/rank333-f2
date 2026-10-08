module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S343 "data/lean/af30f0d838b168b4536f569fc4d0a43b/E236S343.bin"
namespace E236S343
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [254, 372, 412], [22], 11)], 0, E236S343.L1),
([(4, true, false, [254, 372, 412], [22], 13)], 0, E236S343.L2),
([(4, true, false, [254, 372, 412], [22], 17)], 0, E236S343.L3),
([(4, true, false, [254, 372, 412], [22], 18)], 0, E236S343.L4),
([(4, true, false, [254, 372, 412], [22], 20)], 0, E236S343.L5),
([(4, true, false, [254, 372, 412], [22], 25)], 0, E236S343.L6),
([(4, true, false, [254, 372, 412], [22], 26)], 0, E236S343.L7),
([(4, true, false, [254, 372, 412], [22], 27)], 0, E236S343.L8),
([(4, true, false, [254, 372, 412], [22], 28)], 0, E236S343.L9),
([(4, true, false, [254, 372, 412], [22], 29)], 0, E236S343.L10),
([(4, true, false, [254, 372, 412], [22], 39)], 0, E236S343.L11),
([(4, true, false, [254, 372, 412], [22], 40)], 0, E236S343.L12),
([(4, true, false, [254, 372, 412], [22], 46)], 0, E236S343.L13),
([(4, true, false, [254, 372, 412], [22], 55)], 0, E236S343.L14)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 14
end E236S343
