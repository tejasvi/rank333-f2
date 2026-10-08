module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S36 "data/lean/1e24df5689056d6815291f42802f7fc2/E284S36.bin"
namespace E284S36
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [94, 254, 266, 212], [], 0)], 0, E284S36.L1),
([(8, true, false, [94, 254, 266, 212], [], 1)], 0, E284S36.L2),
([(8, true, false, [94, 254, 266, 212], [], 2)], 0, E284S36.L3),
([(8, true, false, [94, 254, 266, 212], [], 3)], 0, E284S36.L4),
([(8, true, false, [94, 254, 266, 212], [], 4)], 0, E284S36.L5),
([(8, true, false, [94, 254, 266, 212], [], 5)], 0, E284S36.L6),
([(8, true, false, [94, 254, 266, 212], [], 8)], 0, E284S36.L7),
([(8, true, false, [94, 254, 266, 212], [], 16)], 0, E284S36.L8),
([(8, true, false, [94, 254, 266, 212], [], 17)], 0, E284S36.L9),
([(8, true, false, [94, 254, 266, 212], [], 26)], 0, E284S36.L10),
([(8, true, false, [94, 254, 266, 212], [], 27)], 0, E284S36.L11),
([(8, true, false, [94, 254, 266, 212], [], 41)], 0, E284S36.L12),
([(8, true, false, [94, 254, 266, 212], [], 55)], 0, E284S36.L13),
([(8, true, false, [94, 254, 266, 212], [], 56)], 0, E284S36.L14),
([(8, true, false, [94, 254, 266, 212], [], 57)], 0, E284S36.L15),
([(8, true, false, [94, 254, 266, 212], [], 58)], 0, E284S36.L16),
([(8, true, false, [94, 254, 266, 212], [], 59)], 0, E284S36.L17),
([(8, true, false, [94, 254, 266, 212], [], 60)], 0, E284S36.L18),
([(8, true, false, [94, 254, 266, 212], [], 61)], 0, E284S36.L19),
([(8, true, false, [94, 254, 266, 212], [], 62)], 0, E284S36.L20),
([(8, true, false, [94, 254, 266, 212], [], 63)], 0, E284S36.L21),
([(8, true, false, [94, 254, 266, 212], [], 64)], 0, E284S36.L22),
([(8, true, false, [94, 254, 266, 212], [], 65)], 0, E284S36.L23),
([(8, true, false, [94, 254, 266, 212], [], 66)], 0, E284S36.L24),
([(8, true, false, [94, 254, 266, 212], [], 71)], 0, E284S36.L25),
([(8, true, false, [94, 254, 266, 212], [], 73)], 0, E284S36.L26),
([(8, true, false, [94, 254, 266, 212], [], 77)], 0, E284S36.L27),
([(8, true, false, [94, 254, 266, 212], [], 79)], 0, E284S36.L28),
([(8, true, false, [94, 254, 266, 212], [], 81)], 0, E284S36.L29),
([(8, true, false, [94, 254, 266, 212], [], 83)], 0, E284S36.L30),
([(8, true, false, [94, 254, 266, 212], [], 86)], 0, E284S36.L31),
([(8, true, false, [94, 254, 266, 212], [], 90)], 0, E284S36.L32),
([(8, true, false, [94, 254, 266, 212], [], 107)], 0, E284S36.L33),
([(8, true, false, [94, 254, 266, 212], [], 115)], 0, E284S36.L34),
([(8, true, false, [94, 254, 266, 212], [], 131)], 0, E284S36.L35),
([(8, true, false, [94, 254, 266, 212], [], 135)], 0, E284S36.L36),
([(8, true, false, [94, 254, 266, 212], [], 146)], 0, E284S36.L37),
([(8, true, false, [94, 254, 266, 212], [], 154)], 0, E284S36.L38),
([(8, true, false, [94, 254, 266, 212], [], 199)], 0, E284S36.L39),
([(8, true, false, [94, 254, 266, 212], [], 205)], 0, E284S36.L40)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 40
end E284S36
