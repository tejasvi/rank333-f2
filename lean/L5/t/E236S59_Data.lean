module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S59 "data/lean/79b61d54a0e6681a1fde4ed072f44a94/E236S59.bin"
namespace E236S59
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(14, true, false, [158, 412], [96], 24)], 0, E236S59.L1),
([(14, true, false, [158, 412], [96], 25)], 0, E236S59.L2),
([(14, true, false, [158, 412], [96], 45)], 0, E236S59.L3),
([(14, true, false, [158, 412], [96], 50)], 0, E236S59.L4),
([(14, true, false, [158, 412], [96], 51)], 0, E236S59.L5),
([(14, true, false, [158, 412], [96], 63)], 0, E236S59.L6),
([(14, true, false, [158, 412], [96], 91)], 0, E236S59.L7),
([(14, true, false, [158, 412], [96], 170)], 0, E236S59.L8),
([(14, true, false, [158, 412], [96], 214)], 0, E236S59.L9),
([(14, true, false, [158, 412], [96], 215)], 0, E236S59.L10),
([(14, true, false, [158, 412], [96], 218)], 0, E236S59.L11)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 11
end E236S59
