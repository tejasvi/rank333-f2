module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E205S14 "data/lean/169ff7964e544e32b93232fbe4895ea5/E205S14.bin"
namespace E205S14
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [116, 314, 494], [160], 2)], 0, E205S14.L1),
([(9, true, false, [116, 314, 494], [160], 3)], 0, E205S14.L2),
([(9, true, false, [116, 314, 494], [160], 4)], 0, E205S14.L3),
([(9, true, false, [116, 314, 494], [160], 5)], 0, E205S14.L4),
([(9, true, false, [116, 314, 494], [160], 6)], 0, E205S14.L5),
([(9, true, false, [116, 314, 494], [160], 11)], 0, E205S14.L6),
([(9, true, false, [116, 314, 494], [160], 13)], 0, E205S14.L7),
([(9, true, false, [116, 314, 494], [160], 14)], 0, E205S14.L8),
([(9, true, false, [116, 314, 494], [160], 15)], 0, E205S14.L9),
([(9, true, false, [116, 314, 494], [160], 16)], 0, E205S14.L10),
([(9, true, false, [116, 314, 494], [160], 17)], 0, E205S14.L11),
([(9, true, false, [116, 314, 494], [160], 23)], 0, E205S14.L12),
([(9, true, false, [116, 314, 494], [160], 24)], 0, E205S14.L13),
([(9, true, false, [116, 314, 494], [160], 25)], 0, E205S14.L14),
([(9, true, false, [116, 314, 494], [160], 26)], 0, E205S14.L15),
([(9, true, false, [116, 314, 494], [160], 27)], 0, E205S14.L16),
([(9, true, false, [116, 314, 494], [160], 28)], 0, E205S14.L17),
([(9, true, false, [116, 314, 494], [160], 30)], 0, E205S14.L18),
([(9, true, false, [116, 314, 494], [160], 31)], 0, E205S14.L19),
([(9, true, false, [116, 314, 494], [160], 32)], 0, E205S14.L20),
([(9, true, false, [116, 314, 494], [160], 33)], 0, E205S14.L21),
([(9, true, false, [116, 314, 494], [160], 34)], 0, E205S14.L22),
([(9, true, false, [116, 314, 494], [160], 35)], 0, E205S14.L23),
([(9, true, false, [116, 314, 494], [160], 36)], 0, E205S14.L24),
([(9, true, false, [116, 314, 494], [160], 37)], 0, E205S14.L25),
([(9, true, false, [116, 314, 494], [160], 38)], 0, E205S14.L26),
([(9, true, false, [116, 314, 494], [160], 39)], 0, E205S14.L27),
([(9, true, false, [116, 314, 494], [160], 41)], 0, E205S14.L28),
([(9, true, false, [116, 314, 494], [160], 44)], 0, E205S14.L29),
([(9, true, false, [116, 314, 494], [160], 45)], 0, E205S14.L30),
([(9, true, false, [116, 314, 494], [160], 46)], 0, E205S14.L31),
([(9, true, false, [116, 314, 494], [160], 47)], 0, E205S14.L32),
([(9, true, false, [116, 314, 494], [160], 48)], 0, E205S14.L33),
([(9, true, false, [116, 314, 494], [160], 49)], 0, E205S14.L34),
([(9, true, false, [116, 314, 494], [160], 50)], 0, E205S14.L35),
([(9, true, false, [116, 314, 494], [160], 51)], 0, E205S14.L36),
([(9, true, false, [116, 314, 494], [160], 52)], 0, E205S14.L37),
([(9, true, false, [116, 314, 494], [160], 53)], 0, E205S14.L38),
([(9, true, false, [116, 314, 494], [160], 55)], 0, E205S14.L39),
([(9, true, false, [116, 314, 494], [160], 56)], 0, E205S14.L40),
([(9, true, false, [116, 314, 494], [160], 58)], 0, E205S14.L41),
([(9, true, false, [116, 314, 494], [160], 59)], 0, E205S14.L42),
([(9, true, false, [116, 314, 494], [160], 63)], 0, E205S14.L43),
([(9, true, false, [116, 314, 494], [160], 64)], 0, E205S14.L44),
([(9, true, false, [116, 314, 494], [160], 65)], 0, E205S14.L45),
([(9, true, false, [116, 314, 494], [160], 67)], 0, E205S14.L46),
([(9, true, false, [116, 314, 494], [160], 69)], 0, E205S14.L47),
([(9, true, false, [116, 314, 494], [160], 71)], 0, E205S14.L48)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 48
end E205S14
