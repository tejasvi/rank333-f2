module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S274 "data/lean/8c0c443ec1aae173d2d1dbf5d12d8355/E236S274.bin"
namespace E236S274
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [254, 372], [118], 17)], 0, E236S274.L1),
([(4, true, false, [254, 372], [118], 18)], 0, E236S274.L2),
([(4, true, false, [254, 372], [118], 27)], 0, E236S274.L3),
([(4, true, false, [254, 372], [118], 28)], 0, E236S274.L4),
([(4, true, false, [254, 372], [118], 30)], 0, E236S274.L5),
([(4, true, false, [254, 372], [118], 32)], 0, E236S274.L6),
([(4, true, false, [254, 372], [118], 33)], 0, E236S274.L7),
([(4, true, false, [254, 372], [118], 38)], 0, E236S274.L8),
([(4, true, false, [254, 372], [118], 47)], 0, E236S274.L9),
([(4, true, false, [254, 372], [118], 48)], 0, E236S274.L10),
([(4, true, false, [254, 372], [118], 62)], 0, E236S274.L11),
([(4, true, false, [254, 372], [118], 81)], 0, E236S274.L12),
([(4, true, false, [254, 372], [118], 94)], 0, E236S274.L13),
([(4, true, false, [254, 372], [118], 107)], 0, E236S274.L14)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 14
end E236S274
