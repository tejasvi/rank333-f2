module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S307 "data/lean/574d48f1e5f079f6649782594f4e0a7e/E236S307.bin"
namespace E236S307
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [158, 394], [258], 0)], 9, E236S307.L1),
([(3, true, false, [158, 394], [258], 1)], 0, E236S307.L2),
([(3, true, false, [158, 394], [258], 2)], 0, E236S307.L3),
([(3, true, false, [158, 394], [258], 3)], 0, E236S307.L4),
([(3, true, false, [158, 394], [258], 4)], 0, E236S307.L5),
([(3, true, false, [158, 394], [258], 5)], 0, E236S307.L6),
([(3, true, false, [158, 394], [258], 6)], 0, E236S307.L7),
([(3, true, false, [158, 394], [258], 7)], 0, E236S307.L8),
([(3, true, false, [158, 394], [258], 8)], 0, E236S307.L9),
([(3, true, false, [158, 394], [258], 9)], 0, E236S307.L10),
([(3, true, false, [158, 394], [258], 10)], 0, E236S307.L11),
([(3, true, false, [158, 394], [258], 16)], 0, E236S307.L12),
([(3, true, false, [158, 394], [258], 17)], 0, E236S307.L13),
([(3, true, false, [158, 394], [258], 18)], 0, E236S307.L14),
([(3, true, false, [158, 394], [258], 20)], 0, E236S307.L15),
([(3, true, false, [158, 394], [258], 26)], 0, E236S307.L16),
([(3, true, false, [158, 394], [258], 29)], 0, E236S307.L17),
([(3, true, false, [158, 394], [258], 35)], 0, E236S307.L18),
([(3, true, false, [158, 394], [258], 44)], 0, E236S307.L19),
([(3, true, false, [158, 394], [258], 50)], 0, E236S307.L20),
([(3, true, false, [158, 394], [258], 54)], 0, E236S307.L21),
([(3, true, false, [158, 394], [258], 56)], 0, E236S307.L22),
([(3, true, false, [158, 394], [258], 63)], 0, E236S307.L23),
([(3, true, false, [158, 394], [258], 64)], 0, E236S307.L24),
([(3, true, false, [158, 394], [258], 65)], 0, E236S307.L25),
([(3, true, false, [158, 394], [258], 70)], 0, E236S307.L26),
([(3, true, false, [158, 394], [258], 72)], 0, E236S307.L27),
([(3, true, false, [158, 394], [258], 79)], 0, E236S307.L28),
([(3, true, false, [158, 394], [258], 100)], 0, E236S307.L29),
([(3, true, false, [158, 394], [258], 101)], 0, E236S307.L30),
([(3, true, false, [158, 394], [258], 108)], 0, E236S307.L31),
([(3, true, false, [158, 394], [258], 110)], 0, E236S307.L32),
([(3, true, false, [158, 394], [258], 112)], 0, E236S307.L33),
([(3, true, false, [158, 394], [258], 113)], 0, E236S307.L34),
([(3, true, false, [158, 394], [258], 127)], 0, E236S307.L35),
([(3, true, false, [158, 394], [258], 132)], 0, E236S307.L36),
([(3, true, false, [158, 394], [258], 133)], 0, E236S307.L37),
([(3, true, false, [158, 394], [258], 0), (2, false, false, [254], [258], 376)], 0, E236S307.L38),
([(3, true, false, [158, 394], [258], 0), (2, false, false, [254], [258], 408)], 0, E236S307.L39),
([(3, true, false, [158, 394], [258], 0), (2, false, false, [254], [258], 620)], 0, E236S307.L40),
([(3, true, false, [158, 394], [258], 0), (2, false, false, [254], [258], 748)], 0, E236S307.L41),
([(3, true, false, [158, 394], [258], 0), (2, false, false, [254], [258], 960)], 0, E236S307.L42),
([(3, true, false, [158, 394], [258], 0), (2, false, false, [254], [258], 976)], 0, E236S307.L43),
([(3, true, false, [158, 394], [258], 0), (2, false, false, [254], [258], 1052)], 0, E236S307.L44),
([(3, true, false, [158, 394], [258], 0), (2, false, false, [254], [258], 1488)], 0, E236S307.L45),
([(3, true, false, [158, 394], [258], 0), (2, false, false, [254], [258], 1516)], 0, E236S307.L46)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 37
end E236S307
