module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S329 "data/lean/88951c6d1d647ae16d6c914862cae4fa/E284S329.bin"
namespace E284S329
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(15, true, false, [94, 340, 372, 84, 116, 382], [], 10)], 0, E284S329.L1),
([(15, true, false, [94, 340, 372, 84, 116, 382], [], 11)], 0, E284S329.L2),
([(15, true, false, [94, 340, 372, 84, 116, 382], [], 12)], 0, E284S329.L3),
([(15, true, false, [94, 340, 372, 84, 116, 382], [], 13)], 0, E284S329.L4),
([(15, true, false, [94, 340, 372, 84, 116, 382], [], 14)], 0, E284S329.L5),
([(15, true, false, [94, 340, 372, 84, 116, 382], [], 15)], 0, E284S329.L6),
([(15, true, false, [94, 340, 372, 84, 116, 382], [], 16)], 0, E284S329.L7),
([(15, true, false, [94, 340, 372, 84, 116, 382], [], 22)], 0, E284S329.L8),
([(15, true, false, [94, 340, 372, 84, 116, 382], [], 29)], 0, E284S329.L9),
([(15, true, false, [94, 340, 372, 84, 116, 382], [], 44)], 0, E284S329.L10),
([(15, true, false, [94, 340, 372, 84, 116, 382], [], 47)], 0, E284S329.L11),
([(15, true, false, [94, 340, 372, 84, 116, 382], [], 64)], 0, E284S329.L12),
([(15, true, false, [94, 340, 372, 84, 116, 382], [], 91)], 0, E284S329.L13),
([(15, true, false, [94, 340, 372, 84, 116, 382], [], 135)], 0, E284S329.L14),
([(15, true, false, [94, 340, 372, 84, 116, 382], [], 144)], 0, E284S329.L15),
([(15, true, false, [94, 340, 372, 84, 116, 382], [], 149)], 0, E284S329.L16),
([(15, true, false, [94, 340, 372, 84, 116, 382], [], 167)], 0, E284S329.L17),
([(15, true, false, [94, 340, 372, 84, 116, 382], [], 181)], 0, E284S329.L18),
([(15, true, false, [94, 340, 372, 84, 116, 382], [], 183)], 0, E284S329.L19),
([(15, true, false, [94, 340, 372, 84, 116, 382], [], 190)], 0, E284S329.L20),
([(15, true, false, [94, 340, 372, 84, 116, 382], [], 196)], 0, E284S329.L21),
([(15, true, false, [94, 340, 372, 84, 116, 382], [], 207)], 0, E284S329.L22),
([(15, true, false, [94, 340, 372, 84, 116, 382], [], 215)], 0, E284S329.L23),
([(15, true, false, [94, 340, 372, 84, 116, 382], [], 227)], 0, E284S329.L24),
([(15, true, false, [94, 340, 372, 84, 116, 382], [], 245)], 0, E284S329.L25)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 25
end E284S329
