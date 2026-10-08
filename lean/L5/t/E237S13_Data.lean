module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E237S13 "data/lean/9a1f1fc4efc85f79f2ee35d7f67694f9/E237S13.bin"
namespace E237S13
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [158, 234], [96, 392], 0)], 0, E237S13.L1),
([(8, true, false, [158, 234], [96, 392], 2)], 0, E237S13.L2),
([(8, true, false, [158, 234], [96, 392], 8)], 0, E237S13.L3),
([(8, true, false, [158, 234], [96, 392], 12)], 0, E237S13.L4),
([(8, true, false, [158, 234], [96, 392], 24)], 0, E237S13.L5),
([(8, true, false, [158, 234], [96, 392], 30)], 0, E237S13.L6),
([(8, true, false, [158, 234], [96, 392], 32)], 0, E237S13.L7),
([(8, true, false, [158, 234], [96, 392], 43)], 0, E237S13.L8),
([(8, true, false, [158, 234], [96, 392], 46)], 0, E237S13.L9),
([(8, true, false, [158, 234], [96, 392], 49)], 0, E237S13.L10),
([(8, true, false, [158, 234], [96, 392], 51)], 0, E237S13.L11),
([(8, true, false, [158, 234], [96, 392], 52)], 0, E237S13.L12),
([(8, true, false, [158, 234], [96, 392], 53)], 0, E237S13.L13),
([(8, true, false, [158, 234], [96, 392], 54)], 0, E237S13.L14),
([(8, true, false, [158, 234], [96, 392], 56)], 0, E237S13.L15),
([(8, true, false, [158, 234], [96, 392], 59)], 0, E237S13.L16),
([(8, true, false, [158, 234], [96, 392], 60)], 0, E237S13.L17),
([(8, true, false, [158, 234], [96, 392], 63)], 0, E237S13.L18),
([(8, true, false, [158, 234], [96, 392], 64)], 0, E237S13.L19),
([(8, true, false, [158, 234], [96, 392], 65)], 0, E237S13.L20),
([(8, true, false, [158, 234], [96, 392], 66)], 0, E237S13.L21),
([(8, true, false, [158, 234], [96, 392], 67)], 0, E237S13.L22),
([(8, true, false, [158, 234], [96, 392], 68)], 0, E237S13.L23),
([(8, true, false, [158, 234], [96, 392], 69)], 0, E237S13.L24),
([(8, true, false, [158, 234], [96, 392], 72)], 0, E237S13.L25),
([(8, true, false, [158, 234], [96, 392], 74)], 0, E237S13.L26),
([(8, true, false, [158, 234], [96, 392], 75)], 0, E237S13.L27),
([(8, true, false, [158, 234], [96, 392], 77)], 0, E237S13.L28),
([(8, true, false, [158, 234], [96, 392], 78)], 0, E237S13.L29),
([(8, true, false, [158, 234], [96, 392], 79)], 0, E237S13.L30),
([(8, true, false, [158, 234], [96, 392], 108)], 0, E237S13.L31),
([(8, true, false, [158, 234], [96, 392], 122)], 0, E237S13.L32),
([(8, true, false, [158, 234], [96, 392], 140)], 0, E237S13.L33),
([(8, true, false, [158, 234], [96, 392], 142)], 0, E237S13.L34),
([(8, true, false, [158, 234], [96, 392], 148)], 0, E237S13.L35)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 35
end E237S13
