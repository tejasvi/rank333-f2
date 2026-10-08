module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S129 "data/lean/987f207cecdce1283dfe5b2145107ea2/E218S129.bin"
namespace E218S129
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [266, 494, 106], [], 1)], 0, E218S129.L1),
([(8, true, false, [266, 494, 106], [], 3)], 0, E218S129.L2),
([(8, true, false, [266, 494, 106], [], 4)], 0, E218S129.L3),
([(8, true, false, [266, 494, 106], [], 21)], 0, E218S129.L4),
([(8, true, false, [266, 494, 106], [], 23)], 0, E218S129.L5),
([(8, true, false, [266, 494, 106], [], 33)], 0, E218S129.L6),
([(8, true, false, [266, 494, 106], [], 44)], 0, E218S129.L7),
([(8, true, false, [266, 494, 106], [], 52)], 0, E218S129.L8),
([(8, true, false, [266, 494, 106], [], 53)], 0, E218S129.L9),
([(8, true, false, [266, 494, 106], [], 88)], 0, E218S129.L10),
([(8, true, false, [266, 494, 106], [], 89)], 0, E218S129.L11),
([(8, true, false, [266, 494, 106], [], 91)], 0, E218S129.L12),
([(8, true, false, [266, 494, 106], [], 92)], 0, E218S129.L13),
([(8, true, false, [266, 494, 106], [], 108)], 0, E218S129.L14),
([(8, true, false, [266, 494, 106], [], 113)], 0, E218S129.L15),
([(8, true, false, [266, 494, 106], [], 120)], 0, E218S129.L16),
([(8, true, false, [266, 494, 106], [], 162)], 0, E218S129.L17),
([(8, true, false, [266, 494, 106], [], 163)], 0, E218S129.L18),
([(8, true, false, [266, 494, 106], [], 165)], 0, E218S129.L19),
([(8, true, false, [266, 494, 106], [], 166)], 0, E218S129.L20),
([(8, true, false, [266, 494, 106], [], 175)], 0, E218S129.L21),
([(8, true, false, [266, 494, 106], [], 180)], 0, E218S129.L22),
([(8, true, false, [266, 494, 106], [], 184)], 0, E218S129.L23),
([(8, true, false, [266, 494, 106], [], 195)], 0, E218S129.L24),
([(8, true, false, [266, 494, 106], [], 202)], 0, E218S129.L25),
([(8, true, false, [266, 494, 106], [], 204)], 0, E218S129.L26),
([(8, true, false, [266, 494, 106], [], 216)], 0, E218S129.L27),
([(8, true, false, [266, 494, 106], [], 221)], 0, E218S129.L28),
([(8, true, false, [266, 494, 106], [], 225)], 0, E218S129.L29),
([(8, true, false, [266, 494, 106], [], 228)], 0, E218S129.L30),
([(8, true, false, [266, 494, 106], [], 243)], 0, E218S129.L31),
([(8, true, false, [266, 494, 106], [], 260)], 0, E218S129.L32),
([(8, true, false, [266, 494, 106], [], 304)], 0, E218S129.L33),
([(8, true, false, [266, 494, 106], [], 308)], 0, E218S129.L34),
([(8, true, false, [266, 494, 106], [], 316)], 0, E218S129.L35),
([(8, true, false, [266, 494, 106], [], 352)], 0, E218S129.L36),
([(8, true, false, [266, 494, 106], [], 356)], 0, E218S129.L37),
([(8, true, false, [266, 494, 106], [], 364)], 0, E218S129.L38),
([(8, true, false, [266, 494, 106], [], 400)], 0, E218S129.L39),
([(8, true, false, [266, 494, 106], [], 433)], 0, E218S129.L40),
([(8, true, false, [266, 494, 106], [], 436)], 0, E218S129.L41),
([(8, true, false, [266, 494, 106], [], 496)], 0, E218S129.L42),
([(8, true, false, [266, 494, 106], [], 508)], 0, E218S129.L43)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 43
end E218S129
