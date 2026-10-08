module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S102 "data/lean/845df9f709910aeb99727d99f8bc5e64/E284S102.bin"
namespace E284S102
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [84, 382], [10, 138], 0)], 0, E284S102.L1),
([(3, true, false, [84, 382], [10, 138], 3)], 0, E284S102.L2),
([(3, true, false, [84, 382], [10, 138], 8)], 0, E284S102.L3),
([(3, true, false, [84, 382], [10, 138], 23)], 0, E284S102.L4),
([(3, true, false, [84, 382], [10, 138], 25)], 0, E284S102.L5),
([(3, true, false, [84, 382], [10, 138], 27)], 0, E284S102.L6),
([(3, true, false, [84, 382], [10, 138], 28)], 0, E284S102.L7),
([(3, true, false, [84, 382], [10, 138], 29)], 0, E284S102.L8),
([(3, true, false, [84, 382], [10, 138], 32)], 0, E284S102.L9),
([(3, true, false, [84, 382], [10, 138], 37)], 0, E284S102.L10),
([(3, true, false, [84, 382], [10, 138], 39)], 0, E284S102.L11),
([(3, true, false, [84, 382], [10, 138], 40)], 16, E284S102.L12),
([(3, true, false, [84, 382], [10, 138], 42)], 0, E284S102.L13),
([(3, true, false, [84, 382], [10, 138], 44)], 0, E284S102.L14),
([(3, true, false, [84, 382], [10, 138], 48)], 0, E284S102.L15),
([(3, true, false, [84, 382], [10, 138], 49)], 0, E284S102.L16),
([(3, true, false, [84, 382], [10, 138], 50)], 0, E284S102.L17),
([(3, true, false, [84, 382], [10, 138], 52)], 0, E284S102.L18),
([(3, true, false, [84, 382], [10, 138], 54)], 0, E284S102.L19),
([(3, true, false, [84, 382], [10, 138], 56)], 0, E284S102.L20),
([(3, true, false, [84, 382], [10, 138], 57)], 0, E284S102.L21),
([(3, true, false, [84, 382], [10, 138], 58)], 0, E284S102.L22),
([(3, true, false, [84, 382], [10, 138], 59)], 0, E284S102.L23),
([(3, true, false, [84, 382], [10, 138], 63)], 0, E284S102.L24),
([(3, true, false, [84, 382], [10, 138], 65)], 0, E284S102.L25),
([(3, true, false, [84, 382], [10, 138], 68)], 0, E284S102.L26),
([(3, true, false, [84, 382], [10, 138], 76)], 0, E284S102.L27),
([(3, true, false, [84, 382], [10, 138], 88)], 0, E284S102.L28),
([(3, true, false, [84, 382], [10, 138], 96)], 0, E284S102.L29),
([(3, true, false, [84, 382], [10, 138], 113)], 0, E284S102.L30),
([(3, true, false, [84, 382], [10, 138], 123)], 0, E284S102.L31),
([(3, true, false, [84, 382], [10, 138], 126)], 0, E284S102.L32),
([(3, true, false, [84, 382], [10, 138], 40), (4, false, false, [468], [10, 138], 256)], 0, E284S102.L33),
([(3, true, false, [84, 382], [10, 138], 40), (4, false, false, [468], [10, 138], 257)], 0, E284S102.L34),
([(3, true, false, [84, 382], [10, 138], 40), (4, false, false, [468], [10, 138], 258)], 0, E284S102.L35),
([(3, true, false, [84, 382], [10, 138], 40), (4, false, false, [468], [10, 138], 259)], 0, E284S102.L36),
([(3, true, false, [84, 382], [10, 138], 40), (4, false, false, [468], [10, 138], 288)], 0, E284S102.L37),
([(3, true, false, [84, 382], [10, 138], 40), (4, false, false, [468], [10, 138], 289)], 0, E284S102.L38),
([(3, true, false, [84, 382], [10, 138], 40), (4, false, false, [468], [10, 138], 290)], 0, E284S102.L39),
([(3, true, false, [84, 382], [10, 138], 40), (4, false, false, [468], [10, 138], 291)], 0, E284S102.L40),
([(3, true, false, [84, 382], [10, 138], 40), (4, false, false, [468], [10, 138], 532)], 0, E284S102.L41),
([(3, true, false, [84, 382], [10, 138], 40), (4, false, false, [468], [10, 138], 533)], 0, E284S102.L42),
([(3, true, false, [84, 382], [10, 138], 40), (4, false, false, [468], [10, 138], 534)], 0, E284S102.L43),
([(3, true, false, [84, 382], [10, 138], 40), (4, false, false, [468], [10, 138], 535)], 0, E284S102.L44),
([(3, true, false, [84, 382], [10, 138], 40), (4, false, false, [468], [10, 138], 540)], 0, E284S102.L45),
([(3, true, false, [84, 382], [10, 138], 40), (4, false, false, [468], [10, 138], 541)], 0, E284S102.L46),
([(3, true, false, [84, 382], [10, 138], 40), (4, false, false, [468], [10, 138], 542)], 0, E284S102.L47),
([(3, true, false, [84, 382], [10, 138], 40), (4, false, false, [468], [10, 138], 543)], 0, E284S102.L48)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 32
end E284S102
