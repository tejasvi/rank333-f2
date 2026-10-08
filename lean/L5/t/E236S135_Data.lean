module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S135 "data/lean/7756950dcfb602f2d2d59dbac33a8a95/E236S135.bin"
namespace E236S135
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [158, 372, 412], [118], 0)], 11, E236S135.L1),
([(0, true, false, [158, 372, 412], [118], 2)], 0, E236S135.L2),
([(0, true, false, [158, 372, 412], [118], 3)], 0, E236S135.L3),
([(0, true, false, [158, 372, 412], [118], 4)], 0, E236S135.L4),
([(0, true, false, [158, 372, 412], [118], 11)], 0, E236S135.L5),
([(0, true, false, [158, 372, 412], [118], 12)], 0, E236S135.L6),
([(0, true, false, [158, 372, 412], [118], 14)], 0, E236S135.L7),
([(0, true, false, [158, 372, 412], [118], 17)], 0, E236S135.L8),
([(0, true, false, [158, 372, 412], [118], 20)], 0, E236S135.L9),
([(0, true, false, [158, 372, 412], [118], 23)], 0, E236S135.L10),
([(0, true, false, [158, 372, 412], [118], 27)], 0, E236S135.L11),
([(0, true, false, [158, 372, 412], [118], 32)], 0, E236S135.L12),
([(0, true, false, [158, 372, 412], [118], 34)], 0, E236S135.L13),
([(0, true, false, [158, 372, 412], [118], 36)], 0, E236S135.L14),
([(0, true, false, [158, 372, 412], [118], 50)], 0, E236S135.L15),
([(0, true, false, [158, 372, 412], [118], 51)], 0, E236S135.L16),
([(0, true, false, [158, 372, 412], [118], 74)], 0, E236S135.L17),
([(0, true, false, [158, 372, 412], [118], 0), (1, false, false, [], [118], 0)], 0, E236S135.L18),
([(0, true, false, [158, 372, 412], [118], 0), (1, false, false, [], [118], 3)], 0, E236S135.L19),
([(0, true, false, [158, 372, 412], [118], 0), (1, false, false, [], [118], 4)], 0, E236S135.L20),
([(0, true, false, [158, 372, 412], [118], 0), (1, false, false, [], [118], 7)], 0, E236S135.L21),
([(0, true, false, [158, 372, 412], [118], 0), (1, false, false, [], [118], 8)], 0, E236S135.L22),
([(0, true, false, [158, 372, 412], [118], 0), (1, false, false, [], [118], 11)], 0, E236S135.L23),
([(0, true, false, [158, 372, 412], [118], 0), (1, false, false, [], [118], 12)], 0, E236S135.L24),
([(0, true, false, [158, 372, 412], [118], 0), (1, false, false, [], [118], 15)], 0, E236S135.L25),
([(0, true, false, [158, 372, 412], [118], 0), (1, false, false, [], [118], 16)], 0, E236S135.L26),
([(0, true, false, [158, 372, 412], [118], 0), (1, false, false, [], [118], 19)], 0, E236S135.L27),
([(0, true, false, [158, 372, 412], [118], 0), (1, false, false, [], [118], 20)], 0, E236S135.L28)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 17
end E236S135
