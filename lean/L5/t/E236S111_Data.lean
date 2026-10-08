module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S111 "data/lean/cf198ce3c862c9bd28e04c61b8fbe15a/E236S111.bin"
namespace E236S111
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [158, 372], [258], 2)], 0, E236S111.L1),
([(2, true, false, [158, 372], [258], 3)], 0, E236S111.L2),
([(2, true, false, [158, 372], [258], 4)], 0, E236S111.L3),
([(2, true, false, [158, 372], [258], 7)], 0, E236S111.L4),
([(2, true, false, [158, 372], [258], 28)], 0, E236S111.L5),
([(2, true, false, [158, 372], [258], 37)], 0, E236S111.L6),
([(2, true, false, [158, 372], [258], 38)], 0, E236S111.L7),
([(2, true, false, [158, 372], [258], 39)], 0, E236S111.L8),
([(2, true, false, [158, 372], [258], 40)], 0, E236S111.L9),
([(2, true, false, [158, 372], [258], 41)], 0, E236S111.L10),
([(2, true, false, [158, 372], [258], 42)], 0, E236S111.L11),
([(2, true, false, [158, 372], [258], 44)], 0, E236S111.L12),
([(2, true, false, [158, 372], [258], 45)], 0, E236S111.L13),
([(2, true, false, [158, 372], [258], 46)], 0, E236S111.L14),
([(2, true, false, [158, 372], [258], 63)], 0, E236S111.L15),
([(2, true, false, [158, 372], [258], 66)], 0, E236S111.L16),
([(2, true, false, [158, 372], [258], 68)], 0, E236S111.L17),
([(2, true, false, [158, 372], [258], 70)], 0, E236S111.L18),
([(2, true, false, [158, 372], [258], 79)], 0, E236S111.L19),
([(2, true, false, [158, 372], [258], 90)], 0, E236S111.L20),
([(2, true, false, [158, 372], [258], 117)], 0, E236S111.L21)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 21
end E236S111
