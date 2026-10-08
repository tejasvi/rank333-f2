module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S404 "data/lean/5a7ba3ef9b4195362a5459882e15b4d5/E236S404.bin"
namespace E236S404
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(11, true, false, [254, 354, 372], [96], 0)], 0, E236S404.L1),
([(11, true, false, [254, 354, 372], [96], 6)], 0, E236S404.L2),
([(11, true, false, [254, 354, 372], [96], 12)], 0, E236S404.L3),
([(11, true, false, [254, 354, 372], [96], 13)], 0, E236S404.L4),
([(11, true, false, [254, 354, 372], [96], 17)], 0, E236S404.L5),
([(11, true, false, [254, 354, 372], [96], 18)], 0, E236S404.L6),
([(11, true, false, [254, 354, 372], [96], 22)], 0, E236S404.L7),
([(11, true, false, [254, 354, 372], [96], 28)], 0, E236S404.L8),
([(11, true, false, [254, 354, 372], [96], 32)], 0, E236S404.L9),
([(11, true, false, [254, 354, 372], [96], 38)], 0, E236S404.L10),
([(11, true, false, [254, 354, 372], [96], 42)], 0, E236S404.L11),
([(11, true, false, [254, 354, 372], [96], 46)], 0, E236S404.L12),
([(11, true, false, [254, 354, 372], [96], 66)], 0, E236S404.L13),
([(11, true, false, [254, 354, 372], [96], 75)], 0, E236S404.L14),
([(11, true, false, [254, 354, 372], [96], 84)], 0, E236S404.L15),
([(11, true, false, [254, 354, 372], [96], 86)], 0, E236S404.L16),
([(11, true, false, [254, 354, 372], [96], 89)], 0, E236S404.L17),
([(11, true, false, [254, 354, 372], [96], 90)], 0, E236S404.L18),
([(11, true, false, [254, 354, 372], [96], 91)], 0, E236S404.L19),
([(11, true, false, [254, 354, 372], [96], 92)], 0, E236S404.L20),
([(11, true, false, [254, 354, 372], [96], 94)], 0, E236S404.L21),
([(11, true, false, [254, 354, 372], [96], 102)], 0, E236S404.L22),
([(11, true, false, [254, 354, 372], [96], 104)], 0, E236S404.L23),
([(11, true, false, [254, 354, 372], [96], 109)], 0, E236S404.L24),
([(11, true, false, [254, 354, 372], [96], 116)], 0, E236S404.L25),
([(11, true, false, [254, 354, 372], [96], 120)], 0, E236S404.L26),
([(11, true, false, [254, 354, 372], [96], 123)], 0, E236S404.L27),
([(11, true, false, [254, 354, 372], [96], 128)], 0, E236S404.L28),
([(11, true, false, [254, 354, 372], [96], 129)], 0, E236S404.L29),
([(11, true, false, [254, 354, 372], [96], 130)], 0, E236S404.L30),
([(11, true, false, [254, 354, 372], [96], 131)], 0, E236S404.L31)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 31
end E236S404
