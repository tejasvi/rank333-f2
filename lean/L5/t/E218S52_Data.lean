module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S52 "data/lean/d4ac91091be908ccf6cd738a5cfa9426/E218S52.bin"
namespace E218S52
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [254, 266, 494], [], 15)], 0, E218S52.L1),
([(8, true, false, [254, 266, 494], [], 20)], 0, E218S52.L2),
([(8, true, false, [254, 266, 494], [], 22)], 0, E218S52.L3),
([(8, true, false, [254, 266, 494], [], 25)], 0, E218S52.L4),
([(8, true, false, [254, 266, 494], [], 31)], 0, E218S52.L5),
([(8, true, false, [254, 266, 494], [], 74)], 0, E218S52.L6),
([(8, true, false, [254, 266, 494], [], 75)], 0, E218S52.L7),
([(8, true, false, [254, 266, 494], [], 76)], 0, E218S52.L8),
([(8, true, false, [254, 266, 494], [], 77)], 0, E218S52.L9),
([(8, true, false, [254, 266, 494], [], 78)], 0, E218S52.L10),
([(8, true, false, [254, 266, 494], [], 79)], 0, E218S52.L11),
([(8, true, false, [254, 266, 494], [], 80)], 0, E218S52.L12),
([(8, true, false, [254, 266, 494], [], 81)], 0, E218S52.L13),
([(8, true, false, [254, 266, 494], [], 82)], 0, E218S52.L14),
([(8, true, false, [254, 266, 494], [], 83)], 0, E218S52.L15),
([(8, true, false, [254, 266, 494], [], 85)], 0, E218S52.L16),
([(8, true, false, [254, 266, 494], [], 89)], 0, E218S52.L17),
([(8, true, false, [254, 266, 494], [], 94)], 0, E218S52.L18),
([(8, true, false, [254, 266, 494], [], 102)], 0, E218S52.L19),
([(8, true, false, [254, 266, 494], [], 139)], 0, E218S52.L20),
([(8, true, false, [254, 266, 494], [], 140)], 0, E218S52.L21),
([(8, true, false, [254, 266, 494], [], 143)], 0, E218S52.L22),
([(8, true, false, [254, 266, 494], [], 146)], 0, E218S52.L23),
([(8, true, false, [254, 266, 494], [], 148)], 0, E218S52.L24),
([(8, true, false, [254, 266, 494], [], 149)], 0, E218S52.L25),
([(8, true, false, [254, 266, 494], [], 152)], 0, E218S52.L26),
([(8, true, false, [254, 266, 494], [], 155)], 0, E218S52.L27),
([(8, true, false, [254, 266, 494], [], 159)], 0, E218S52.L28),
([(8, true, false, [254, 266, 494], [], 165)], 0, E218S52.L29),
([(8, true, false, [254, 266, 494], [], 173)], 0, E218S52.L30),
([(8, true, false, [254, 266, 494], [], 202)], 0, E218S52.L31),
([(8, true, false, [254, 266, 494], [], 209)], 0, E218S52.L32),
([(8, true, false, [254, 266, 494], [], 236)], 0, E218S52.L33),
([(8, true, false, [254, 266, 494], [], 238)], 0, E218S52.L34),
([(8, true, false, [254, 266, 494], [], 242)], 0, E218S52.L35),
([(8, true, false, [254, 266, 494], [], 246)], 0, E218S52.L36),
([(8, true, false, [254, 266, 494], [], 247)], 0, E218S52.L37),
([(8, true, false, [254, 266, 494], [], 260)], 0, E218S52.L38),
([(8, true, false, [254, 266, 494], [], 290)], 0, E218S52.L39),
([(8, true, false, [254, 266, 494], [], 291)], 0, E218S52.L40),
([(8, true, false, [254, 266, 494], [], 294)], 0, E218S52.L41),
([(8, true, false, [254, 266, 494], [], 301)], 0, E218S52.L42),
([(8, true, false, [254, 266, 494], [], 306)], 0, E218S52.L43),
([(8, true, false, [254, 266, 494], [], 307)], 0, E218S52.L44),
([(8, true, false, [254, 266, 494], [], 334)], 0, E218S52.L45),
([(8, true, false, [254, 266, 494], [], 335)], 0, E218S52.L46),
([(8, true, false, [254, 266, 494], [], 340)], 0, E218S52.L47),
([(8, true, false, [254, 266, 494], [], 341)], 0, E218S52.L48),
([(8, true, false, [254, 266, 494], [], 368)], 0, E218S52.L49),
([(8, true, false, [254, 266, 494], [], 371)], 0, E218S52.L50),
([(8, true, false, [254, 266, 494], [], 374)], 0, E218S52.L51),
([(8, true, false, [254, 266, 494], [], 378)], 0, E218S52.L52),
([(8, true, false, [254, 266, 494], [], 385)], 0, E218S52.L53),
([(8, true, false, [254, 266, 494], [], 392)], 0, E218S52.L54),
([(8, true, false, [254, 266, 494], [], 442)], 0, E218S52.L55),
([(8, true, false, [254, 266, 494], [], 496)], 0, E218S52.L56)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 56
end E218S52
