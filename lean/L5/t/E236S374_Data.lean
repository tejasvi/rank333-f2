module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S374 "data/lean/0be1486c3f151ce52f2154f8ae10b001/E236S374.bin"
namespace E236S374
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [354, 412], [96], 2)], 0, E236S374.L1),
([(13, true, false, [354, 412], [96], 8)], 0, E236S374.L2),
([(13, true, false, [354, 412], [96], 21)], 0, E236S374.L3),
([(13, true, false, [354, 412], [96], 36)], 0, E236S374.L4),
([(13, true, false, [354, 412], [96], 37)], 0, E236S374.L5),
([(13, true, false, [354, 412], [96], 38)], 0, E236S374.L6),
([(13, true, false, [354, 412], [96], 39)], 0, E236S374.L7),
([(13, true, false, [354, 412], [96], 44)], 0, E236S374.L8),
([(13, true, false, [354, 412], [96], 48)], 0, E236S374.L9),
([(13, true, false, [354, 412], [96], 49)], 0, E236S374.L10),
([(13, true, false, [354, 412], [96], 56)], 0, E236S374.L11),
([(13, true, false, [354, 412], [96], 76)], 0, E236S374.L12),
([(13, true, false, [354, 412], [96], 78)], 0, E236S374.L13),
([(13, true, false, [354, 412], [96], 92)], 0, E236S374.L14),
([(13, true, false, [354, 412], [96], 94)], 0, E236S374.L15),
([(13, true, false, [354, 412], [96], 168)], 0, E236S374.L16),
([(13, true, false, [354, 412], [96], 169)], 0, E236S374.L17),
([(13, true, false, [354, 412], [96], 171)], 0, E236S374.L18),
([(13, true, false, [354, 412], [96], 179)], 0, E236S374.L19),
([(13, true, false, [354, 412], [96], 214)], 0, E236S374.L20),
([(13, true, false, [354, 412], [96], 215)], 0, E236S374.L21),
([(13, true, false, [354, 412], [96], 217)], 0, E236S374.L22)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 22
end E236S374
