module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S110 "data/lean/cfb0cd96f0362c7bb039e257ed7d83cf/E218S110.bin"
namespace E218S110
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(11, true, false, [494, 500, 142], [], 0)], 0, E218S110.L1),
([(11, true, false, [494, 500, 142], [], 1)], 0, E218S110.L2),
([(11, true, false, [494, 500, 142], [], 7)], 0, E218S110.L3),
([(11, true, false, [494, 500, 142], [], 10)], 0, E218S110.L4),
([(11, true, false, [494, 500, 142], [], 11)], 0, E218S110.L5),
([(11, true, false, [494, 500, 142], [], 15)], 0, E218S110.L6),
([(11, true, false, [494, 500, 142], [], 16)], 0, E218S110.L7),
([(11, true, false, [494, 500, 142], [], 21)], 0, E218S110.L8),
([(11, true, false, [494, 500, 142], [], 43)], 0, E218S110.L9),
([(11, true, false, [494, 500, 142], [], 74)], 0, E218S110.L10),
([(11, true, false, [494, 500, 142], [], 84)], 0, E218S110.L11),
([(11, true, false, [494, 500, 142], [], 85)], 0, E218S110.L12),
([(11, true, false, [494, 500, 142], [], 86)], 0, E218S110.L13),
([(11, true, false, [494, 500, 142], [], 87)], 0, E218S110.L14),
([(11, true, false, [494, 500, 142], [], 88)], 0, E218S110.L15),
([(11, true, false, [494, 500, 142], [], 90)], 0, E218S110.L16),
([(11, true, false, [494, 500, 142], [], 91)], 0, E218S110.L17),
([(11, true, false, [494, 500, 142], [], 92)], 0, E218S110.L18),
([(11, true, false, [494, 500, 142], [], 93)], 0, E218S110.L19),
([(11, true, false, [494, 500, 142], [], 100)], 0, E218S110.L20),
([(11, true, false, [494, 500, 142], [], 101)], 0, E218S110.L21),
([(11, true, false, [494, 500, 142], [], 102)], 0, E218S110.L22),
([(11, true, false, [494, 500, 142], [], 106)], 0, E218S110.L23),
([(11, true, false, [494, 500, 142], [], 107)], 0, E218S110.L24),
([(11, true, false, [494, 500, 142], [], 136)], 0, E218S110.L25),
([(11, true, false, [494, 500, 142], [], 148)], 0, E218S110.L26),
([(11, true, false, [494, 500, 142], [], 150)], 0, E218S110.L27),
([(11, true, false, [494, 500, 142], [], 156)], 0, E218S110.L28),
([(11, true, false, [494, 500, 142], [], 158)], 0, E218S110.L29),
([(11, true, false, [494, 500, 142], [], 176)], 0, E218S110.L30),
([(11, true, false, [494, 500, 142], [], 181)], 0, E218S110.L31),
([(11, true, false, [494, 500, 142], [], 260)], 0, E218S110.L32),
([(11, true, false, [494, 500, 142], [], 264)], 0, E218S110.L33),
([(11, true, false, [494, 500, 142], [], 269)], 0, E218S110.L34),
([(11, true, false, [494, 500, 142], [], 270)], 0, E218S110.L35),
([(11, true, false, [494, 500, 142], [], 273)], 0, E218S110.L36),
([(11, true, false, [494, 500, 142], [], 302)], 0, E218S110.L37),
([(11, true, false, [494, 500, 142], [], 317)], 0, E218S110.L38),
([(11, true, false, [494, 500, 142], [], 320)], 0, E218S110.L39),
([(11, true, false, [494, 500, 142], [], 321)], 0, E218S110.L40),
([(11, true, false, [494, 500, 142], [], 508)], 0, E218S110.L41),
([(11, true, false, [494, 500, 142], [], 509)], 0, E218S110.L42)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 42
end E218S110
