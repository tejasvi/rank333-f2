module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S197 "data/lean/7f3189ffe157303e09f5f2930081312f/E213S197.bin"
namespace E213S197
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(11, true, false, [106], [148, 388], 0)], 0, E213S197.L1),
([(11, true, false, [106], [148, 388], 1)], 0, E213S197.L2),
([(11, true, false, [106], [148, 388], 3)], 0, E213S197.L3),
([(11, true, false, [106], [148, 388], 6)], 0, E213S197.L4),
([(11, true, false, [106], [148, 388], 9)], 0, E213S197.L5),
([(11, true, false, [106], [148, 388], 11)], 0, E213S197.L6),
([(11, true, false, [106], [148, 388], 12)], 0, E213S197.L7),
([(11, true, false, [106], [148, 388], 13)], 0, E213S197.L8),
([(11, true, false, [106], [148, 388], 14)], 0, E213S197.L9),
([(11, true, false, [106], [148, 388], 23)], 0, E213S197.L10),
([(11, true, false, [106], [148, 388], 24)], 0, E213S197.L11),
([(11, true, false, [106], [148, 388], 26)], 0, E213S197.L12),
([(11, true, false, [106], [148, 388], 27)], 0, E213S197.L13),
([(11, true, false, [106], [148, 388], 28)], 0, E213S197.L14),
([(11, true, false, [106], [148, 388], 30)], 0, E213S197.L15),
([(11, true, false, [106], [148, 388], 31)], 0, E213S197.L16),
([(11, true, false, [106], [148, 388], 32)], 0, E213S197.L17),
([(11, true, false, [106], [148, 388], 34)], 0, E213S197.L18),
([(11, true, false, [106], [148, 388], 35)], 0, E213S197.L19),
([(11, true, false, [106], [148, 388], 36)], 0, E213S197.L20),
([(11, true, false, [106], [148, 388], 37)], 0, E213S197.L21),
([(11, true, false, [106], [148, 388], 38)], 0, E213S197.L22),
([(11, true, false, [106], [148, 388], 39)], 0, E213S197.L23),
([(11, true, false, [106], [148, 388], 40)], 0, E213S197.L24),
([(11, true, false, [106], [148, 388], 41)], 0, E213S197.L25),
([(11, true, false, [106], [148, 388], 42)], 0, E213S197.L26),
([(11, true, false, [106], [148, 388], 43)], 0, E213S197.L27),
([(11, true, false, [106], [148, 388], 45)], 0, E213S197.L28),
([(11, true, false, [106], [148, 388], 48)], 0, E213S197.L29),
([(11, true, false, [106], [148, 388], 58)], 0, E213S197.L30),
([(11, true, false, [106], [148, 388], 67)], 0, E213S197.L31),
([(11, true, false, [106], [148, 388], 69)], 0, E213S197.L32),
([(11, true, false, [106], [148, 388], 70)], 0, E213S197.L33),
([(11, true, false, [106], [148, 388], 71)], 0, E213S197.L34),
([(11, true, false, [106], [148, 388], 73)], 0, E213S197.L35),
([(11, true, false, [106], [148, 388], 78)], 0, E213S197.L36),
([(11, true, false, [106], [148, 388], 83)], 0, E213S197.L37),
([(11, true, false, [106], [148, 388], 84)], 0, E213S197.L38),
([(11, true, false, [106], [148, 388], 87)], 0, E213S197.L39),
([(11, true, false, [106], [148, 388], 94)], 0, E213S197.L40),
([(11, true, false, [106], [148, 388], 96)], 0, E213S197.L41),
([(11, true, false, [106], [148, 388], 101)], 0, E213S197.L42),
([(11, true, false, [106], [148, 388], 110)], 0, E213S197.L43),
([(11, true, false, [106], [148, 388], 118)], 0, E213S197.L44),
([(11, true, false, [106], [148, 388], 142)], 0, E213S197.L45),
([(11, true, false, [106], [148, 388], 153)], 0, E213S197.L46)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 46
end E213S197
