module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S206 "data/lean/34950cb5d70baadce6a501f009803803/E236S206.bin"
namespace E236S206
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(12, true, false, [394, 254, 412], [232], 7)], 0, E236S206.L1),
([(12, true, false, [394, 254, 412], [232], 13)], 0, E236S206.L2),
([(12, true, false, [394, 254, 412], [232], 53)], 0, E236S206.L3),
([(12, true, false, [394, 254, 412], [232], 74)], 0, E236S206.L4),
([(12, true, false, [394, 254, 412], [232], 82)], 0, E236S206.L5),
([(12, true, false, [394, 254, 412], [232], 95)], 0, E236S206.L6),
([(12, true, false, [394, 254, 412], [232], 112)], 0, E236S206.L7),
([(12, true, false, [394, 254, 412], [232], 151)], 0, E236S206.L8),
([(12, true, false, [394, 254, 412], [232], 161)], 0, E236S206.L9),
([(12, true, false, [394, 254, 412], [232], 168)], 0, E236S206.L10),
([(12, true, false, [394, 254, 412], [232], 174)], 0, E236S206.L11),
([(12, true, false, [394, 254, 412], [232], 214)], 0, E236S206.L12),
([(12, true, false, [394, 254, 412], [232], 227)], 0, E236S206.L13)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 13
end E236S206
