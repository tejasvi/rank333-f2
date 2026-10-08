module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S124 "data/lean/fc5343503b481bcc5cec25036035f4f7/E236S124.bin"
namespace E236S124
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(15, true, false, [412], [22, 258], 1)], 0, E236S124.L1),
([(15, true, false, [412], [22, 258], 2)], 0, E236S124.L2),
([(15, true, false, [412], [22, 258], 5)], 0, E236S124.L3),
([(15, true, false, [412], [22, 258], 23)], 0, E236S124.L4),
([(15, true, false, [412], [22, 258], 24)], 0, E236S124.L5),
([(15, true, false, [412], [22, 258], 25)], 0, E236S124.L6),
([(15, true, false, [412], [22, 258], 26)], 0, E236S124.L7),
([(15, true, false, [412], [22, 258], 28)], 0, E236S124.L8),
([(15, true, false, [412], [22, 258], 30)], 0, E236S124.L9),
([(15, true, false, [412], [22, 258], 34)], 0, E236S124.L10),
([(15, true, false, [412], [22, 258], 36)], 0, E236S124.L11),
([(15, true, false, [412], [22, 258], 45)], 0, E236S124.L12),
([(15, true, false, [412], [22, 258], 47)], 0, E236S124.L13),
([(15, true, false, [412], [22, 258], 48)], 0, E236S124.L14),
([(15, true, false, [412], [22, 258], 49)], 0, E236S124.L15),
([(15, true, false, [412], [22, 258], 51)], 0, E236S124.L16),
([(15, true, false, [412], [22, 258], 52)], 0, E236S124.L17),
([(15, true, false, [412], [22, 258], 54)], 0, E236S124.L18),
([(15, true, false, [412], [22, 258], 56)], 0, E236S124.L19),
([(15, true, false, [412], [22, 258], 57)], 0, E236S124.L20),
([(15, true, false, [412], [22, 258], 58)], 0, E236S124.L21),
([(15, true, false, [412], [22, 258], 60)], 0, E236S124.L22),
([(15, true, false, [412], [22, 258], 61)], 0, E236S124.L23),
([(15, true, false, [412], [22, 258], 62)], 0, E236S124.L24),
([(15, true, false, [412], [22, 258], 64)], 0, E236S124.L25),
([(15, true, false, [412], [22, 258], 68)], 0, E236S124.L26),
([(15, true, false, [412], [22, 258], 71)], 0, E236S124.L27),
([(15, true, false, [412], [22, 258], 72)], 0, E236S124.L28),
([(15, true, false, [412], [22, 258], 73)], 0, E236S124.L29),
([(15, true, false, [412], [22, 258], 77)], 0, E236S124.L30),
([(15, true, false, [412], [22, 258], 80)], 0, E236S124.L31),
([(15, true, false, [412], [22, 258], 86)], 0, E236S124.L32),
([(15, true, false, [412], [22, 258], 88)], 0, E236S124.L33),
([(15, true, false, [412], [22, 258], 99)], 0, E236S124.L34),
([(15, true, false, [412], [22, 258], 105)], 0, E236S124.L35),
([(15, true, false, [412], [22, 258], 110)], 0, E236S124.L36),
([(15, true, false, [412], [22, 258], 122)], 0, E236S124.L37),
([(15, true, false, [412], [22, 258], 146)], 0, E236S124.L38)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 38
end E236S124
