module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S226 "data/lean/5fdda9f0325c8d2756edf80162c4da09/E213S226.bin"
namespace E213S226
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [158, 254], [272], 3)], 0, E213S226.L1),
([(7, true, false, [158, 254], [272], 9)], 0, E213S226.L2),
([(7, true, false, [158, 254], [272], 12)], 0, E213S226.L3),
([(7, true, false, [158, 254], [272], 17)], 0, E213S226.L4),
([(7, true, false, [158, 254], [272], 21)], 0, E213S226.L5),
([(7, true, false, [158, 254], [272], 22)], 0, E213S226.L6),
([(7, true, false, [158, 254], [272], 23)], 0, E213S226.L7),
([(7, true, false, [158, 254], [272], 24)], 0, E213S226.L8),
([(7, true, false, [158, 254], [272], 25)], 0, E213S226.L9),
([(7, true, false, [158, 254], [272], 26)], 0, E213S226.L10),
([(7, true, false, [158, 254], [272], 27)], 0, E213S226.L11),
([(7, true, false, [158, 254], [272], 28)], 0, E213S226.L12),
([(7, true, false, [158, 254], [272], 29)], 0, E213S226.L13),
([(7, true, false, [158, 254], [272], 30)], 0, E213S226.L14),
([(7, true, false, [158, 254], [272], 33)], 0, E213S226.L15),
([(7, true, false, [158, 254], [272], 40)], 0, E213S226.L16),
([(7, true, false, [158, 254], [272], 41)], 0, E213S226.L17),
([(7, true, false, [158, 254], [272], 44)], 0, E213S226.L18),
([(7, true, false, [158, 254], [272], 47)], 0, E213S226.L19),
([(7, true, false, [158, 254], [272], 52)], 0, E213S226.L20),
([(7, true, false, [158, 254], [272], 53)], 0, E213S226.L21),
([(7, true, false, [158, 254], [272], 54)], 0, E213S226.L22),
([(7, true, false, [158, 254], [272], 55)], 0, E213S226.L23),
([(7, true, false, [158, 254], [272], 58)], 0, E213S226.L24),
([(7, true, false, [158, 254], [272], 59)], 0, E213S226.L25),
([(7, true, false, [158, 254], [272], 68)], 0, E213S226.L26),
([(7, true, false, [158, 254], [272], 69)], 0, E213S226.L27),
([(7, true, false, [158, 254], [272], 70)], 0, E213S226.L28),
([(7, true, false, [158, 254], [272], 74)], 0, E213S226.L29),
([(7, true, false, [158, 254], [272], 77)], 0, E213S226.L30),
([(7, true, false, [158, 254], [272], 78)], 0, E213S226.L31),
([(7, true, false, [158, 254], [272], 80)], 0, E213S226.L32),
([(7, true, false, [158, 254], [272], 82)], 0, E213S226.L33),
([(7, true, false, [158, 254], [272], 86)], 0, E213S226.L34),
([(7, true, false, [158, 254], [272], 87)], 0, E213S226.L35),
([(7, true, false, [158, 254], [272], 91)], 0, E213S226.L36),
([(7, true, false, [158, 254], [272], 97)], 0, E213S226.L37),
([(7, true, false, [158, 254], [272], 98)], 0, E213S226.L38),
([(7, true, false, [158, 254], [272], 107)], 0, E213S226.L39),
([(7, true, false, [158, 254], [272], 112)], 0, E213S226.L40),
([(7, true, false, [158, 254], [272], 114)], 0, E213S226.L41),
([(7, true, false, [158, 254], [272], 123)], 0, E213S226.L42),
([(7, true, false, [158, 254], [272], 125)], 0, E213S226.L43),
([(7, true, false, [158, 254], [272], 126)], 0, E213S226.L44),
([(7, true, false, [158, 254], [272], 133)], 0, E213S226.L45),
([(7, true, false, [158, 254], [272], 136)], 0, E213S226.L46),
([(7, true, false, [158, 254], [272], 151)], 0, E213S226.L47)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 47
end E213S226
