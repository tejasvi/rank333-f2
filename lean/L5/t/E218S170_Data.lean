module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S170 "data/lean/6ec7dc8cfc1fbb77f0354a7fc71b6d62/E218S170.bin"
namespace E218S170
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(11, true, false, [266, 494, 106], [], 21)], 0, E218S170.L1),
([(11, true, false, [266, 494, 106], [], 23)], 0, E218S170.L2),
([(11, true, false, [266, 494, 106], [], 30)], 0, E218S170.L3),
([(11, true, false, [266, 494, 106], [], 31)], 0, E218S170.L4),
([(11, true, false, [266, 494, 106], [], 44)], 0, E218S170.L5),
([(11, true, false, [266, 494, 106], [], 98)], 0, E218S170.L6),
([(11, true, false, [266, 494, 106], [], 99)], 0, E218S170.L7),
([(11, true, false, [266, 494, 106], [], 100)], 0, E218S170.L8),
([(11, true, false, [266, 494, 106], [], 101)], 0, E218S170.L9),
([(11, true, false, [266, 494, 106], [], 102)], 0, E218S170.L10),
([(11, true, false, [266, 494, 106], [], 103)], 0, E218S170.L11),
([(11, true, false, [266, 494, 106], [], 104)], 0, E218S170.L12),
([(11, true, false, [266, 494, 106], [], 105)], 0, E218S170.L13),
([(11, true, false, [266, 494, 106], [], 106)], 0, E218S170.L14),
([(11, true, false, [266, 494, 106], [], 107)], 0, E218S170.L15),
([(11, true, false, [266, 494, 106], [], 113)], 0, E218S170.L16),
([(11, true, false, [266, 494, 106], [], 163)], 0, E218S170.L17),
([(11, true, false, [266, 494, 106], [], 167)], 0, E218S170.L18),
([(11, true, false, [266, 494, 106], [], 260)], 0, E218S170.L19),
([(11, true, false, [266, 494, 106], [], 272)], 0, E218S170.L20),
([(11, true, false, [266, 494, 106], [], 275)], 0, E218S170.L21),
([(11, true, false, [266, 494, 106], [], 293)], 0, E218S170.L22),
([(11, true, false, [266, 494, 106], [], 297)], 0, E218S170.L23),
([(11, true, false, [266, 494, 106], [], 301)], 0, E218S170.L24),
([(11, true, false, [266, 494, 106], [], 352)], 0, E218S170.L25),
([(11, true, false, [266, 494, 106], [], 353)], 0, E218S170.L26),
([(11, true, false, [266, 494, 106], [], 356)], 0, E218S170.L27),
([(11, true, false, [266, 494, 106], [], 359)], 0, E218S170.L28),
([(11, true, false, [266, 494, 106], [], 364)], 0, E218S170.L29),
([(11, true, false, [266, 494, 106], [], 384)], 0, E218S170.L30),
([(11, true, false, [266, 494, 106], [], 395)], 0, E218S170.L31),
([(11, true, false, [266, 494, 106], [], 397)], 0, E218S170.L32),
([(11, true, false, [266, 494, 106], [], 433)], 0, E218S170.L33)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 33
end E218S170
