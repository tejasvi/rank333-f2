module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S357 "data/lean/4b349ad04b4cb3e9e25892236bfb5c29/E236S357.bin"
namespace E236S357
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [158, 354, 372], [136], 0)], 0, E236S357.L1),
([(0, true, false, [158, 354, 372], [136], 1)], 0, E236S357.L2),
([(0, true, false, [158, 354, 372], [136], 2)], 0, E236S357.L3),
([(0, true, false, [158, 354, 372], [136], 4)], 0, E236S357.L4),
([(0, true, false, [158, 354, 372], [136], 15)], 4, E236S357.L5),
([(0, true, false, [158, 354, 372], [136], 17)], 0, E236S357.L6),
([(0, true, false, [158, 354, 372], [136], 22)], 0, E236S357.L7),
([(0, true, false, [158, 354, 372], [136], 24)], 0, E236S357.L8),
([(0, true, false, [158, 354, 372], [136], 36)], 0, E236S357.L9),
([(0, true, false, [158, 354, 372], [136], 40)], 0, E236S357.L10),
([(0, true, false, [158, 354, 372], [136], 44)], 0, E236S357.L11),
([(0, true, false, [158, 354, 372], [136], 45)], 0, E236S357.L12),
([(0, true, false, [158, 354, 372], [136], 50)], 0, E236S357.L13),
([(0, true, false, [158, 354, 372], [136], 51)], 0, E236S357.L14),
([(0, true, false, [158, 354, 372], [136], 62)], 0, E236S357.L15),
([(0, true, false, [158, 354, 372], [136], 63)], 0, E236S357.L16),
([(0, true, false, [158, 354, 372], [136], 64)], 0, E236S357.L17),
([(0, true, false, [158, 354, 372], [136], 66)], 0, E236S357.L18),
([(0, true, false, [158, 354, 372], [136], 67)], 0, E236S357.L19),
([(0, true, false, [158, 354, 372], [136], 68)], 0, E236S357.L20),
([(0, true, false, [158, 354, 372], [136], 70)], 0, E236S357.L21),
([(0, true, false, [158, 354, 372], [136], 74)], 0, E236S357.L22),
([(0, true, false, [158, 354, 372], [136], 15), (1, false, false, [], [136], 56)], 0, E236S357.L23),
([(0, true, false, [158, 354, 372], [136], 15), (1, false, false, [], [136], 58)], 0, E236S357.L24),
([(0, true, false, [158, 354, 372], [136], 15), (1, false, false, [], [136], 60)], 0, E236S357.L25),
([(0, true, false, [158, 354, 372], [136], 15), (1, false, false, [], [136], 62)], 0, E236S357.L26)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 22
end E236S357
