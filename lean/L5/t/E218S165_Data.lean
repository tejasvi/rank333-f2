module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S165 "data/lean/4e7b607926c7e39e83cdf380fb41652a/E218S165.bin"
namespace E218S165
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [254, 494, 500, 142], [], 0)], 0, E218S165.L1),
([(5, true, false, [254, 494, 500, 142], [], 2)], 0, E218S165.L2),
([(5, true, false, [254, 494, 500, 142], [], 5)], 0, E218S165.L3),
([(5, true, false, [254, 494, 500, 142], [], 7)], 0, E218S165.L4),
([(5, true, false, [254, 494, 500, 142], [], 10)], 0, E218S165.L5),
([(5, true, false, [254, 494, 500, 142], [], 16)], 0, E218S165.L6),
([(5, true, false, [254, 494, 500, 142], [], 25)], 0, E218S165.L7),
([(5, true, false, [254, 494, 500, 142], [], 27)], 0, E218S165.L8),
([(5, true, false, [254, 494, 500, 142], [], 40)], 0, E218S165.L9),
([(5, true, false, [254, 494, 500, 142], [], 44)], 0, E218S165.L10),
([(5, true, false, [254, 494, 500, 142], [], 54)], 0, E218S165.L11),
([(5, true, false, [254, 494, 500, 142], [], 55)], 0, E218S165.L12),
([(5, true, false, [254, 494, 500, 142], [], 66)], 0, E218S165.L13),
([(5, true, false, [254, 494, 500, 142], [], 74)], 0, E218S165.L14),
([(5, true, false, [254, 494, 500, 142], [], 75)], 0, E218S165.L15),
([(5, true, false, [254, 494, 500, 142], [], 78)], 0, E218S165.L16),
([(5, true, false, [254, 494, 500, 142], [], 79)], 0, E218S165.L17),
([(5, true, false, [254, 494, 500, 142], [], 92)], 0, E218S165.L18),
([(5, true, false, [254, 494, 500, 142], [], 96)], 0, E218S165.L19),
([(5, true, false, [254, 494, 500, 142], [], 101)], 0, E218S165.L20),
([(5, true, false, [254, 494, 500, 142], [], 111)], 0, E218S165.L21),
([(5, true, false, [254, 494, 500, 142], [], 115)], 0, E218S165.L22),
([(5, true, false, [254, 494, 500, 142], [], 122)], 0, E218S165.L23),
([(5, true, false, [254, 494, 500, 142], [], 123)], 0, E218S165.L24),
([(5, true, false, [254, 494, 500, 142], [], 131)], 0, E218S165.L25),
([(5, true, false, [254, 494, 500, 142], [], 132)], 0, E218S165.L26),
([(5, true, false, [254, 494, 500, 142], [], 141)], 0, E218S165.L27),
([(5, true, false, [254, 494, 500, 142], [], 144)], 0, E218S165.L28),
([(5, true, false, [254, 494, 500, 142], [], 155)], 0, E218S165.L29),
([(5, true, false, [254, 494, 500, 142], [], 162)], 0, E218S165.L30),
([(5, true, false, [254, 494, 500, 142], [], 163)], 0, E218S165.L31),
([(5, true, false, [254, 494, 500, 142], [], 166)], 0, E218S165.L32),
([(5, true, false, [254, 494, 500, 142], [], 167)], 0, E218S165.L33),
([(5, true, false, [254, 494, 500, 142], [], 210)], 0, E218S165.L34),
([(5, true, false, [254, 494, 500, 142], [], 211)], 0, E218S165.L35),
([(5, true, false, [254, 494, 500, 142], [], 214)], 0, E218S165.L36),
([(5, true, false, [254, 494, 500, 142], [], 215)], 0, E218S165.L37)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 37
end E218S165
