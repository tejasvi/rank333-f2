module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E205S21 "data/lean/e5daff3cd4ac5bb13e832312eff6a759/E205S21.bin"
namespace E205S21
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [116, 314], [304], 0)], 0, E205S21.L1),
([(8, true, false, [116, 314], [304], 1)], 0, E205S21.L2),
([(8, true, false, [116, 314], [304], 2)], 0, E205S21.L3),
([(8, true, false, [116, 314], [304], 5)], 0, E205S21.L4),
([(8, true, false, [116, 314], [304], 8)], 0, E205S21.L5),
([(8, true, false, [116, 314], [304], 9)], 0, E205S21.L6),
([(8, true, false, [116, 314], [304], 11)], 0, E205S21.L7),
([(8, true, false, [116, 314], [304], 12)], 0, E205S21.L8),
([(8, true, false, [116, 314], [304], 15)], 0, E205S21.L9),
([(8, true, false, [116, 314], [304], 16)], 0, E205S21.L10),
([(8, true, false, [116, 314], [304], 23)], 0, E205S21.L11),
([(8, true, false, [116, 314], [304], 24)], 0, E205S21.L12),
([(8, true, false, [116, 314], [304], 25)], 0, E205S21.L13),
([(8, true, false, [116, 314], [304], 26)], 0, E205S21.L14),
([(8, true, false, [116, 314], [304], 27)], 0, E205S21.L15),
([(8, true, false, [116, 314], [304], 28)], 0, E205S21.L16),
([(8, true, false, [116, 314], [304], 29)], 0, E205S21.L17),
([(8, true, false, [116, 314], [304], 30)], 0, E205S21.L18),
([(8, true, false, [116, 314], [304], 31)], 0, E205S21.L19),
([(8, true, false, [116, 314], [304], 32)], 0, E205S21.L20),
([(8, true, false, [116, 314], [304], 33)], 0, E205S21.L21),
([(8, true, false, [116, 314], [304], 34)], 0, E205S21.L22),
([(8, true, false, [116, 314], [304], 38)], 0, E205S21.L23),
([(8, true, false, [116, 314], [304], 41)], 0, E205S21.L24),
([(8, true, false, [116, 314], [304], 42)], 0, E205S21.L25),
([(8, true, false, [116, 314], [304], 43)], 0, E205S21.L26),
([(8, true, false, [116, 314], [304], 44)], 0, E205S21.L27),
([(8, true, false, [116, 314], [304], 45)], 0, E205S21.L28),
([(8, true, false, [116, 314], [304], 47)], 0, E205S21.L29),
([(8, true, false, [116, 314], [304], 48)], 0, E205S21.L30),
([(8, true, false, [116, 314], [304], 50)], 0, E205S21.L31),
([(8, true, false, [116, 314], [304], 51)], 0, E205S21.L32),
([(8, true, false, [116, 314], [304], 52)], 0, E205S21.L33),
([(8, true, false, [116, 314], [304], 54)], 0, E205S21.L34),
([(8, true, false, [116, 314], [304], 55)], 0, E205S21.L35),
([(8, true, false, [116, 314], [304], 60)], 0, E205S21.L36),
([(8, true, false, [116, 314], [304], 61)], 0, E205S21.L37),
([(8, true, false, [116, 314], [304], 67)], 0, E205S21.L38),
([(8, true, false, [116, 314], [304], 72)], 0, E205S21.L39),
([(8, true, false, [116, 314], [304], 73)], 0, E205S21.L40),
([(8, true, false, [116, 314], [304], 92)], 0, E205S21.L41),
([(8, true, false, [116, 314], [304], 102)], 0, E205S21.L42),
([(8, true, false, [116, 314], [304], 104)], 0, E205S21.L43),
([(8, true, false, [116, 314], [304], 105)], 0, E205S21.L44),
([(8, true, false, [116, 314], [304], 110)], 0, E205S21.L45),
([(8, true, false, [116, 314], [304], 111)], 0, E205S21.L46),
([(8, true, false, [116, 314], [304], 117)], 0, E205S21.L47),
([(8, true, false, [116, 314], [304], 118)], 0, E205S21.L48),
([(8, true, false, [116, 314], [304], 129)], 0, E205S21.L49),
([(8, true, false, [116, 314], [304], 130)], 0, E205S21.L50),
([(8, true, false, [116, 314], [304], 133)], 0, E205S21.L51),
([(8, true, false, [116, 314], [304], 138)], 0, E205S21.L52)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 52
end E205S21
