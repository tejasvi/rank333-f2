module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S398 "data/lean/8109355110a9b4e047f406ba56d40a60/E236S398.bin"
namespace E236S398
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [354, 372], [136], 1)], 0, E236S398.L1),
([(0, true, false, [354, 372], [136], 4)], 0, E236S398.L2),
([(0, true, false, [354, 372], [136], 20)], 0, E236S398.L3),
([(0, true, false, [354, 372], [136], 21)], 0, E236S398.L4),
([(0, true, false, [354, 372], [136], 26)], 0, E236S398.L5),
([(0, true, false, [354, 372], [136], 34)], 0, E236S398.L6),
([(0, true, false, [354, 372], [136], 38)], 0, E236S398.L7),
([(0, true, false, [354, 372], [136], 39)], 0, E236S398.L8),
([(0, true, false, [354, 372], [136], 61)], 0, E236S398.L9),
([(0, true, false, [354, 372], [136], 69)], 0, E236S398.L10),
([(0, true, false, [354, 372], [136], 74)], 0, E236S398.L11),
([(0, true, false, [354, 372], [136], 76)], 0, E236S398.L12),
([(0, true, false, [354, 372], [136], 78)], 0, E236S398.L13),
([(0, true, false, [354, 372], [136], 79)], 0, E236S398.L14),
([(0, true, false, [354, 372], [136], 82)], 0, E236S398.L15),
([(0, true, false, [354, 372], [136], 83)], 0, E236S398.L16),
([(0, true, false, [354, 372], [136], 86)], 0, E236S398.L17),
([(0, true, false, [354, 372], [136], 87)], 0, E236S398.L18),
([(0, true, false, [354, 372], [136], 90)], 0, E236S398.L19),
([(0, true, false, [354, 372], [136], 91)], 0, E236S398.L20),
([(0, true, false, [354, 372], [136], 92)], 0, E236S398.L21),
([(0, true, false, [354, 372], [136], 93)], 0, E236S398.L22),
([(0, true, false, [354, 372], [136], 94)], 0, E236S398.L23),
([(0, true, false, [354, 372], [136], 95)], 0, E236S398.L24),
([(0, true, false, [354, 372], [136], 96)], 0, E236S398.L25),
([(0, true, false, [354, 372], [136], 97)], 0, E236S398.L26),
([(0, true, false, [354, 372], [136], 98)], 0, E236S398.L27),
([(0, true, false, [354, 372], [136], 102)], 0, E236S398.L28),
([(0, true, false, [354, 372], [136], 105)], 0, E236S398.L29),
([(0, true, false, [354, 372], [136], 114)], 0, E236S398.L30),
([(0, true, false, [354, 372], [136], 115)], 0, E236S398.L31),
([(0, true, false, [354, 372], [136], 119)], 0, E236S398.L32),
([(0, true, false, [354, 372], [136], 120)], 0, E236S398.L33),
([(0, true, false, [354, 372], [136], 123)], 0, E236S398.L34),
([(0, true, false, [354, 372], [136], 141)], 0, E236S398.L35),
([(0, true, false, [354, 372], [136], 142)], 0, E236S398.L36),
([(0, true, false, [354, 372], [136], 143)], 0, E236S398.L37),
([(0, true, false, [354, 372], [136], 144)], 0, E236S398.L38),
([(0, true, false, [354, 372], [136], 146)], 0, E236S398.L39)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 39
end E236S398
