module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S418 "data/lean/733a8cc11b00016e7d2f9b925e82d722/E236S418.bin"
namespace E236S418
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [158, 354], [118], 0)], 0, E236S418.L1),
([(2, true, false, [158, 354], [118], 1)], 0, E236S418.L2),
([(2, true, false, [158, 354], [118], 2)], 0, E236S418.L3),
([(2, true, false, [158, 354], [118], 3)], 0, E236S418.L4),
([(2, true, false, [158, 354], [118], 4)], 0, E236S418.L5),
([(2, true, false, [158, 354], [118], 5)], 0, E236S418.L6),
([(2, true, false, [158, 354], [118], 6)], 0, E236S418.L7),
([(2, true, false, [158, 354], [118], 7)], 0, E236S418.L8),
([(2, true, false, [158, 354], [118], 10)], 0, E236S418.L9),
([(2, true, false, [158, 354], [118], 41)], 0, E236S418.L10),
([(2, true, false, [158, 354], [118], 42)], 0, E236S418.L11),
([(2, true, false, [158, 354], [118], 43)], 0, E236S418.L12),
([(2, true, false, [158, 354], [118], 44)], 0, E236S418.L13),
([(2, true, false, [158, 354], [118], 45)], 0, E236S418.L14),
([(2, true, false, [158, 354], [118], 46)], 0, E236S418.L15),
([(2, true, false, [158, 354], [118], 47)], 0, E236S418.L16),
([(2, true, false, [158, 354], [118], 48)], 0, E236S418.L17),
([(2, true, false, [158, 354], [118], 49)], 0, E236S418.L18),
([(2, true, false, [158, 354], [118], 50)], 0, E236S418.L19),
([(2, true, false, [158, 354], [118], 51)], 0, E236S418.L20),
([(2, true, false, [158, 354], [118], 52)], 0, E236S418.L21),
([(2, true, false, [158, 354], [118], 53)], 0, E236S418.L22),
([(2, true, false, [158, 354], [118], 54)], 0, E236S418.L23),
([(2, true, false, [158, 354], [118], 56)], 0, E236S418.L24),
([(2, true, false, [158, 354], [118], 57)], 0, E236S418.L25),
([(2, true, false, [158, 354], [118], 59)], 0, E236S418.L26),
([(2, true, false, [158, 354], [118], 60)], 0, E236S418.L27),
([(2, true, false, [158, 354], [118], 61)], 0, E236S418.L28),
([(2, true, false, [158, 354], [118], 62)], 0, E236S418.L29),
([(2, true, false, [158, 354], [118], 63)], 0, E236S418.L30),
([(2, true, false, [158, 354], [118], 64)], 0, E236S418.L31),
([(2, true, false, [158, 354], [118], 65)], 0, E236S418.L32),
([(2, true, false, [158, 354], [118], 67)], 0, E236S418.L33),
([(2, true, false, [158, 354], [118], 69)], 0, E236S418.L34),
([(2, true, false, [158, 354], [118], 70)], 0, E236S418.L35),
([(2, true, false, [158, 354], [118], 71)], 0, E236S418.L36),
([(2, true, false, [158, 354], [118], 72)], 0, E236S418.L37),
([(2, true, false, [158, 354], [118], 77)], 0, E236S418.L38),
([(2, true, false, [158, 354], [118], 78)], 0, E236S418.L39),
([(2, true, false, [158, 354], [118], 80)], 0, E236S418.L40),
([(2, true, false, [158, 354], [118], 82)], 0, E236S418.L41),
([(2, true, false, [158, 354], [118], 83)], 0, E236S418.L42),
([(2, true, false, [158, 354], [118], 84)], 0, E236S418.L43),
([(2, true, false, [158, 354], [118], 87)], 0, E236S418.L44),
([(2, true, false, [158, 354], [118], 88)], 0, E236S418.L45),
([(2, true, false, [158, 354], [118], 89)], 0, E236S418.L46),
([(2, true, false, [158, 354], [118], 90)], 0, E236S418.L47),
([(2, true, false, [158, 354], [118], 94)], 0, E236S418.L48),
([(2, true, false, [158, 354], [118], 98)], 0, E236S418.L49),
([(2, true, false, [158, 354], [118], 99)], 0, E236S418.L50),
([(2, true, false, [158, 354], [118], 101)], 0, E236S418.L51),
([(2, true, false, [158, 354], [118], 102)], 0, E236S418.L52)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 52
end E236S418
