module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S130 "data/lean/4543ce1475ee645e8ba3786d3a72ffd4/E213S130.bin"
namespace E213S130
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [106], [96], 0)], 0, E213S130.L1),
([(2, true, false, [106], [96], 2)], 0, E213S130.L2),
([(2, true, false, [106], [96], 8)], 0, E213S130.L3),
([(2, true, false, [106], [96], 10)], 0, E213S130.L4),
([(2, true, false, [106], [96], 24)], 0, E213S130.L5),
([(2, true, false, [106], [96], 28)], 0, E213S130.L6),
([(2, true, false, [106], [96], 31)], 0, E213S130.L7),
([(2, true, false, [106], [96], 36)], 0, E213S130.L8),
([(2, true, false, [106], [96], 38)], 0, E213S130.L9),
([(2, true, false, [106], [96], 39)], 0, E213S130.L10),
([(2, true, false, [106], [96], 42)], 0, E213S130.L11),
([(2, true, false, [106], [96], 44)], 0, E213S130.L12),
([(2, true, false, [106], [96], 45)], 0, E213S130.L13),
([(2, true, false, [106], [96], 46)], 0, E213S130.L14),
([(2, true, false, [106], [96], 48)], 0, E213S130.L15),
([(2, true, false, [106], [96], 50)], 0, E213S130.L16),
([(2, true, false, [106], [96], 52)], 0, E213S130.L17),
([(2, true, false, [106], [96], 56)], 0, E213S130.L18),
([(2, true, false, [106], [96], 68)], 0, E213S130.L19),
([(2, true, false, [106], [96], 76)], 0, E213S130.L20),
([(2, true, false, [106], [96], 78)], 0, E213S130.L21),
([(2, true, false, [106], [96], 84)], 0, E213S130.L22),
([(2, true, false, [106], [96], 92)], 0, E213S130.L23),
([(2, true, false, [106], [96], 100)], 0, E213S130.L24),
([(2, true, false, [106], [96], 132)], 0, E213S130.L25),
([(2, true, false, [106], [96], 136)], 0, E213S130.L26),
([(2, true, false, [106], [96], 152)], 0, E213S130.L27),
([(2, true, false, [106], [96], 156)], 0, E213S130.L28),
([(2, true, false, [106], [96], 164)], 0, E213S130.L29),
([(2, true, false, [106], [96], 165)], 0, E213S130.L30),
([(2, true, false, [106], [96], 166)], 0, E213S130.L31),
([(2, true, false, [106], [96], 167)], 0, E213S130.L32),
([(2, true, false, [106], [96], 173)], 0, E213S130.L33),
([(2, true, false, [106], [96], 176)], 0, E213S130.L34),
([(2, true, false, [106], [96], 178)], 0, E213S130.L35),
([(2, true, false, [106], [96], 186)], 0, E213S130.L36),
([(2, true, false, [106], [96], 187)], 0, E213S130.L37),
([(2, true, false, [106], [96], 188)], 0, E213S130.L38),
([(2, true, false, [106], [96], 189)], 0, E213S130.L39),
([(2, true, false, [106], [96], 191)], 0, E213S130.L40),
([(2, true, false, [106], [96], 192)], 0, E213S130.L41),
([(2, true, false, [106], [96], 193)], 0, E213S130.L42),
([(2, true, false, [106], [96], 194)], 0, E213S130.L43),
([(2, true, false, [106], [96], 195)], 0, E213S130.L44),
([(2, true, false, [106], [96], 211)], 0, E213S130.L45),
([(2, true, false, [106], [96], 239)], 0, E213S130.L46),
([(2, true, false, [106], [96], 243)], 0, E213S130.L47),
([(2, true, false, [106], [96], 254)], 0, E213S130.L48)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 48
end E213S130
