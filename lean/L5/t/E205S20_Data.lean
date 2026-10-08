module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E205S20 "data/lean/816b84b1c7d526a059f790dacf9aea71/E205S20.bin"
namespace E205S20
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [212, 410], [400], 0)], 0, E205S20.L1),
([(13, true, false, [212, 410], [400], 2)], 0, E205S20.L2),
([(13, true, false, [212, 410], [400], 3)], 0, E205S20.L3),
([(13, true, false, [212, 410], [400], 4)], 0, E205S20.L4),
([(13, true, false, [212, 410], [400], 5)], 0, E205S20.L5),
([(13, true, false, [212, 410], [400], 6)], 0, E205S20.L6),
([(13, true, false, [212, 410], [400], 7)], 0, E205S20.L7),
([(13, true, false, [212, 410], [400], 8)], 0, E205S20.L8),
([(13, true, false, [212, 410], [400], 9)], 0, E205S20.L9),
([(13, true, false, [212, 410], [400], 10)], 0, E205S20.L10),
([(13, true, false, [212, 410], [400], 11)], 0, E205S20.L11),
([(13, true, false, [212, 410], [400], 12)], 0, E205S20.L12),
([(13, true, false, [212, 410], [400], 13)], 0, E205S20.L13),
([(13, true, false, [212, 410], [400], 14)], 0, E205S20.L14),
([(13, true, false, [212, 410], [400], 16)], 0, E205S20.L15),
([(13, true, false, [212, 410], [400], 17)], 0, E205S20.L16),
([(13, true, false, [212, 410], [400], 20)], 0, E205S20.L17),
([(13, true, false, [212, 410], [400], 27)], 0, E205S20.L18),
([(13, true, false, [212, 410], [400], 29)], 0, E205S20.L19),
([(13, true, false, [212, 410], [400], 31)], 0, E205S20.L20),
([(13, true, false, [212, 410], [400], 32)], 0, E205S20.L21),
([(13, true, false, [212, 410], [400], 34)], 0, E205S20.L22),
([(13, true, false, [212, 410], [400], 36)], 0, E205S20.L23),
([(13, true, false, [212, 410], [400], 41)], 0, E205S20.L24),
([(13, true, false, [212, 410], [400], 42)], 0, E205S20.L25),
([(13, true, false, [212, 410], [400], 43)], 0, E205S20.L26),
([(13, true, false, [212, 410], [400], 45)], 0, E205S20.L27),
([(13, true, false, [212, 410], [400], 46)], 0, E205S20.L28),
([(13, true, false, [212, 410], [400], 47)], 0, E205S20.L29),
([(13, true, false, [212, 410], [400], 49)], 0, E205S20.L30),
([(13, true, false, [212, 410], [400], 51)], 0, E205S20.L31),
([(13, true, false, [212, 410], [400], 52)], 0, E205S20.L32),
([(13, true, false, [212, 410], [400], 53)], 0, E205S20.L33),
([(13, true, false, [212, 410], [400], 54)], 0, E205S20.L34),
([(13, true, false, [212, 410], [400], 55)], 0, E205S20.L35),
([(13, true, false, [212, 410], [400], 60)], 0, E205S20.L36),
([(13, true, false, [212, 410], [400], 65)], 0, E205S20.L37),
([(13, true, false, [212, 410], [400], 70)], 0, E205S20.L38),
([(13, true, false, [212, 410], [400], 73)], 0, E205S20.L39),
([(13, true, false, [212, 410], [400], 74)], 0, E205S20.L40),
([(13, true, false, [212, 410], [400], 92)], 0, E205S20.L41),
([(13, true, false, [212, 410], [400], 105)], 0, E205S20.L42),
([(13, true, false, [212, 410], [400], 107)], 0, E205S20.L43),
([(13, true, false, [212, 410], [400], 111)], 0, E205S20.L44),
([(13, true, false, [212, 410], [400], 113)], 0, E205S20.L45),
([(13, true, false, [212, 410], [400], 118)], 0, E205S20.L46),
([(13, true, false, [212, 410], [400], 119)], 0, E205S20.L47),
([(13, true, false, [212, 410], [400], 122)], 0, E205S20.L48),
([(13, true, false, [212, 410], [400], 129)], 0, E205S20.L49),
([(13, true, false, [212, 410], [400], 133)], 0, E205S20.L50),
([(13, true, false, [212, 410], [400], 135)], 0, E205S20.L51),
([(13, true, false, [212, 410], [400], 139)], 0, E205S20.L52)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 52
end E205S20
