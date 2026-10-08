module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S91 "data/lean/77c505d7ac23bcad0c198ee51cbff6c3/E284S91.bin"
namespace E284S91
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [84, 478], [10, 42], 1)], 16, E284S91.L1),
([(3, true, false, [84, 478], [10, 42], 5)], 0, E284S91.L2),
([(3, true, false, [84, 478], [10, 42], 25)], 0, E284S91.L3),
([(3, true, false, [84, 478], [10, 42], 28)], 0, E284S91.L4),
([(3, true, false, [84, 478], [10, 42], 30)], 0, E284S91.L5),
([(3, true, false, [84, 478], [10, 42], 33)], 0, E284S91.L6),
([(3, true, false, [84, 478], [10, 42], 36)], 0, E284S91.L7),
([(3, true, false, [84, 478], [10, 42], 37)], 0, E284S91.L8),
([(3, true, false, [84, 478], [10, 42], 39)], 0, E284S91.L9),
([(3, true, false, [84, 478], [10, 42], 60)], 0, E284S91.L10),
([(3, true, false, [84, 478], [10, 42], 61)], 0, E284S91.L11),
([(3, true, false, [84, 478], [10, 42], 62)], 0, E284S91.L12),
([(3, true, false, [84, 478], [10, 42], 63)], 0, E284S91.L13),
([(3, true, false, [84, 478], [10, 42], 69)], 0, E284S91.L14),
([(3, true, false, [84, 478], [10, 42], 76)], 0, E284S91.L15),
([(3, true, false, [84, 478], [10, 42], 77)], 0, E284S91.L16),
([(3, true, false, [84, 478], [10, 42], 80)], 0, E284S91.L17),
([(3, true, false, [84, 478], [10, 42], 81)], 0, E284S91.L18),
([(3, true, false, [84, 478], [10, 42], 82)], 0, E284S91.L19),
([(3, true, false, [84, 478], [10, 42], 83)], 0, E284S91.L20),
([(3, true, false, [84, 478], [10, 42], 91)], 0, E284S91.L21),
([(3, true, false, [84, 478], [10, 42], 95)], 0, E284S91.L22),
([(3, true, false, [84, 478], [10, 42], 96)], 0, E284S91.L23),
([(3, true, false, [84, 478], [10, 42], 98)], 0, E284S91.L24),
([(3, true, false, [84, 478], [10, 42], 100)], 0, E284S91.L25),
([(3, true, false, [84, 478], [10, 42], 103)], 0, E284S91.L26),
([(3, true, false, [84, 478], [10, 42], 105)], 0, E284S91.L27),
([(3, true, false, [84, 478], [10, 42], 133)], 0, E284S91.L28),
([(3, true, false, [84, 478], [10, 42], 138)], 0, E284S91.L29),
([(3, true, false, [84, 478], [10, 42], 152)], 0, E284S91.L30),
([(3, true, false, [84, 478], [10, 42], 153)], 0, E284S91.L31),
([(3, true, false, [84, 478], [10, 42], 157)], 0, E284S91.L32),
([(3, true, false, [84, 478], [10, 42], 1), (4, false, false, [372], [10, 42], 32)], 0, E284S91.L33),
([(3, true, false, [84, 478], [10, 42], 1), (4, false, false, [372], [10, 42], 33)], 0, E284S91.L34),
([(3, true, false, [84, 478], [10, 42], 1), (4, false, false, [372], [10, 42], 34)], 0, E284S91.L35),
([(3, true, false, [84, 478], [10, 42], 1), (4, false, false, [372], [10, 42], 35)], 0, E284S91.L36),
([(3, true, false, [84, 478], [10, 42], 1), (4, false, false, [372], [10, 42], 40)], 0, E284S91.L37),
([(3, true, false, [84, 478], [10, 42], 1), (4, false, false, [372], [10, 42], 41)], 0, E284S91.L38),
([(3, true, false, [84, 478], [10, 42], 1), (4, false, false, [372], [10, 42], 42)], 0, E284S91.L39),
([(3, true, false, [84, 478], [10, 42], 1), (4, false, false, [372], [10, 42], 43)], 0, E284S91.L40),
([(3, true, false, [84, 478], [10, 42], 1), (4, false, false, [372], [10, 42], 48)], 0, E284S91.L41),
([(3, true, false, [84, 478], [10, 42], 1), (4, false, false, [372], [10, 42], 49)], 0, E284S91.L42),
([(3, true, false, [84, 478], [10, 42], 1), (4, false, false, [372], [10, 42], 50)], 0, E284S91.L43),
([(3, true, false, [84, 478], [10, 42], 1), (4, false, false, [372], [10, 42], 51)], 0, E284S91.L44),
([(3, true, false, [84, 478], [10, 42], 1), (4, false, false, [372], [10, 42], 56)], 0, E284S91.L45),
([(3, true, false, [84, 478], [10, 42], 1), (4, false, false, [372], [10, 42], 57)], 0, E284S91.L46),
([(3, true, false, [84, 478], [10, 42], 1), (4, false, false, [372], [10, 42], 58)], 0, E284S91.L47),
([(3, true, false, [84, 478], [10, 42], 1), (4, false, false, [372], [10, 42], 59)], 0, E284S91.L48)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 32
end E284S91
