module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S152 "data/lean/5c63989b4e541ab5f3faa19d25753368/E236S152.bin"
namespace E236S152
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(15, true, false, [354], [96, 232], 0)], 0, E236S152.L1),
([(15, true, false, [354], [96, 232], 1)], 0, E236S152.L2),
([(15, true, false, [354], [96, 232], 2)], 0, E236S152.L3),
([(15, true, false, [354], [96, 232], 4)], 0, E236S152.L4),
([(15, true, false, [354], [96, 232], 5)], 0, E236S152.L5),
([(15, true, false, [354], [96, 232], 6)], 0, E236S152.L6),
([(15, true, false, [354], [96, 232], 8)], 0, E236S152.L7),
([(15, true, false, [354], [96, 232], 9)], 0, E236S152.L8),
([(15, true, false, [354], [96, 232], 20)], 0, E236S152.L9),
([(15, true, false, [354], [96, 232], 21)], 0, E236S152.L10),
([(15, true, false, [354], [96, 232], 22)], 0, E236S152.L11),
([(15, true, false, [354], [96, 232], 23)], 0, E236S152.L12),
([(15, true, false, [354], [96, 232], 26)], 0, E236S152.L13),
([(15, true, false, [354], [96, 232], 34)], 0, E236S152.L14),
([(15, true, false, [354], [96, 232], 44)], 0, E236S152.L15),
([(15, true, false, [354], [96, 232], 45)], 0, E236S152.L16),
([(15, true, false, [354], [96, 232], 46)], 0, E236S152.L17),
([(15, true, false, [354], [96, 232], 48)], 0, E236S152.L18),
([(15, true, false, [354], [96, 232], 49)], 0, E236S152.L19),
([(15, true, false, [354], [96, 232], 52)], 0, E236S152.L20),
([(15, true, false, [354], [96, 232], 53)], 0, E236S152.L21),
([(15, true, false, [354], [96, 232], 54)], 0, E236S152.L22),
([(15, true, false, [354], [96, 232], 56)], 0, E236S152.L23),
([(15, true, false, [354], [96, 232], 58)], 0, E236S152.L24),
([(15, true, false, [354], [96, 232], 59)], 0, E236S152.L25),
([(15, true, false, [354], [96, 232], 60)], 0, E236S152.L26),
([(15, true, false, [354], [96, 232], 61)], 0, E236S152.L27),
([(15, true, false, [354], [96, 232], 66)], 0, E236S152.L28),
([(15, true, false, [354], [96, 232], 68)], 0, E236S152.L29),
([(15, true, false, [354], [96, 232], 80)], 0, E236S152.L30),
([(15, true, false, [354], [96, 232], 81)], 0, E236S152.L31),
([(15, true, false, [354], [96, 232], 82)], 0, E236S152.L32),
([(15, true, false, [354], [96, 232], 83)], 0, E236S152.L33),
([(15, true, false, [354], [96, 232], 84)], 0, E236S152.L34),
([(15, true, false, [354], [96, 232], 85)], 0, E236S152.L35),
([(15, true, false, [354], [96, 232], 86)], 0, E236S152.L36),
([(15, true, false, [354], [96, 232], 87)], 0, E236S152.L37),
([(15, true, false, [354], [96, 232], 88)], 0, E236S152.L38),
([(15, true, false, [354], [96, 232], 89)], 0, E236S152.L39),
([(15, true, false, [354], [96, 232], 90)], 0, E236S152.L40),
([(15, true, false, [354], [96, 232], 91)], 0, E236S152.L41),
([(15, true, false, [354], [96, 232], 104)], 0, E236S152.L42),
([(15, true, false, [354], [96, 232], 106)], 0, E236S152.L43),
([(15, true, false, [354], [96, 232], 119)], 0, E236S152.L44),
([(15, true, false, [354], [96, 232], 120)], 0, E236S152.L45),
([(15, true, false, [354], [96, 232], 121)], 0, E236S152.L46),
([(15, true, false, [354], [96, 232], 122)], 0, E236S152.L47),
([(15, true, false, [354], [96, 232], 124)], 0, E236S152.L48),
([(15, true, false, [354], [96, 232], 127)], 0, E236S152.L49),
([(15, true, false, [354], [96, 232], 128)], 0, E236S152.L50),
([(15, true, false, [354], [96, 232], 131)], 0, E236S152.L51),
([(15, true, false, [354], [96, 232], 132)], 0, E236S152.L52),
([(15, true, false, [354], [96, 232], 134)], 0, E236S152.L53)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 53
end E236S152
