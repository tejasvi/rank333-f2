module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S202 "data/lean/74c4d7ef9e6aa2fd484854c3fd3d088a/E213S202.bin"
namespace E213S202
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(15, true, false, [494], [272, 388], 1)], 0, E213S202.L1),
([(15, true, false, [494], [272, 388], 3)], 0, E213S202.L2),
([(15, true, false, [494], [272, 388], 7)], 0, E213S202.L3),
([(15, true, false, [494], [272, 388], 24)], 0, E213S202.L4),
([(15, true, false, [494], [272, 388], 25)], 0, E213S202.L5),
([(15, true, false, [494], [272, 388], 26)], 0, E213S202.L6),
([(15, true, false, [494], [272, 388], 31)], 0, E213S202.L7),
([(15, true, false, [494], [272, 388], 32)], 0, E213S202.L8),
([(15, true, false, [494], [272, 388], 35)], 0, E213S202.L9),
([(15, true, false, [494], [272, 388], 37)], 0, E213S202.L10),
([(15, true, false, [494], [272, 388], 46)], 0, E213S202.L11),
([(15, true, false, [494], [272, 388], 47)], 0, E213S202.L12),
([(15, true, false, [494], [272, 388], 48)], 0, E213S202.L13),
([(15, true, false, [494], [272, 388], 49)], 0, E213S202.L14),
([(15, true, false, [494], [272, 388], 50)], 0, E213S202.L15),
([(15, true, false, [494], [272, 388], 51)], 0, E213S202.L16),
([(15, true, false, [494], [272, 388], 52)], 0, E213S202.L17),
([(15, true, false, [494], [272, 388], 53)], 0, E213S202.L18),
([(15, true, false, [494], [272, 388], 55)], 0, E213S202.L19),
([(15, true, false, [494], [272, 388], 56)], 0, E213S202.L20),
([(15, true, false, [494], [272, 388], 57)], 0, E213S202.L21),
([(15, true, false, [494], [272, 388], 58)], 0, E213S202.L22),
([(15, true, false, [494], [272, 388], 59)], 0, E213S202.L23),
([(15, true, false, [494], [272, 388], 60)], 0, E213S202.L24),
([(15, true, false, [494], [272, 388], 61)], 0, E213S202.L25),
([(15, true, false, [494], [272, 388], 62)], 0, E213S202.L26),
([(15, true, false, [494], [272, 388], 63)], 0, E213S202.L27),
([(15, true, false, [494], [272, 388], 64)], 0, E213S202.L28),
([(15, true, false, [494], [272, 388], 68)], 0, E213S202.L29),
([(15, true, false, [494], [272, 388], 69)], 0, E213S202.L30),
([(15, true, false, [494], [272, 388], 70)], 0, E213S202.L31),
([(15, true, false, [494], [272, 388], 71)], 0, E213S202.L32),
([(15, true, false, [494], [272, 388], 74)], 0, E213S202.L33),
([(15, true, false, [494], [272, 388], 76)], 0, E213S202.L34),
([(15, true, false, [494], [272, 388], 84)], 0, E213S202.L35),
([(15, true, false, [494], [272, 388], 87)], 0, E213S202.L36),
([(15, true, false, [494], [272, 388], 90)], 0, E213S202.L37),
([(15, true, false, [494], [272, 388], 93)], 0, E213S202.L38),
([(15, true, false, [494], [272, 388], 99)], 0, E213S202.L39),
([(15, true, false, [494], [272, 388], 110)], 0, E213S202.L40),
([(15, true, false, [494], [272, 388], 115)], 0, E213S202.L41),
([(15, true, false, [494], [272, 388], 123)], 0, E213S202.L42),
([(15, true, false, [494], [272, 388], 142)], 0, E213S202.L43),
([(15, true, false, [494], [272, 388], 146)], 0, E213S202.L44)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 44
end E213S202
