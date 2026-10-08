module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S166 "data/lean/423597a94c81f9b8517897179be68e70/E213S166.bin"
namespace E213S166
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [106], [96], 0)], 0, E213S166.L1),
([(6, true, false, [106], [96], 2)], 0, E213S166.L2),
([(6, true, false, [106], [96], 8)], 0, E213S166.L3),
([(6, true, false, [106], [96], 10)], 0, E213S166.L4),
([(6, true, false, [106], [96], 21)], 0, E213S166.L5),
([(6, true, false, [106], [96], 23)], 0, E213S166.L6),
([(6, true, false, [106], [96], 36)], 0, E213S166.L7),
([(6, true, false, [106], [96], 37)], 0, E213S166.L8),
([(6, true, false, [106], [96], 40)], 0, E213S166.L9),
([(6, true, false, [106], [96], 41)], 0, E213S166.L10),
([(6, true, false, [106], [96], 48)], 0, E213S166.L11),
([(6, true, false, [106], [96], 49)], 0, E213S166.L12),
([(6, true, false, [106], [96], 50)], 0, E213S166.L13),
([(6, true, false, [106], [96], 54)], 0, E213S166.L14),
([(6, true, false, [106], [96], 55)], 0, E213S166.L15),
([(6, true, false, [106], [96], 56)], 0, E213S166.L16),
([(6, true, false, [106], [96], 68)], 0, E213S166.L17),
([(6, true, false, [106], [96], 76)], 0, E213S166.L18),
([(6, true, false, [106], [96], 84)], 0, E213S166.L19),
([(6, true, false, [106], [96], 92)], 0, E213S166.L20),
([(6, true, false, [106], [96], 100)], 0, E213S166.L21),
([(6, true, false, [106], [96], 132)], 0, E213S166.L22),
([(6, true, false, [106], [96], 136)], 0, E213S166.L23),
([(6, true, false, [106], [96], 152)], 0, E213S166.L24),
([(6, true, false, [106], [96], 156)], 0, E213S166.L25),
([(6, true, false, [106], [96], 168)], 0, E213S166.L26),
([(6, true, false, [106], [96], 176)], 0, E213S166.L27),
([(6, true, false, [106], [96], 210)], 0, E213S166.L28),
([(6, true, false, [106], [96], 212)], 0, E213S166.L29),
([(6, true, false, [106], [96], 214)], 0, E213S166.L30),
([(6, true, false, [106], [96], 215)], 0, E213S166.L31),
([(6, true, false, [106], [96], 218)], 0, E213S166.L32),
([(6, true, false, [106], [96], 222)], 0, E213S166.L33),
([(6, true, false, [106], [96], 228)], 0, E213S166.L34),
([(6, true, false, [106], [96], 254)], 0, E213S166.L35),
([(6, true, false, [106], [96], 258)], 0, E213S166.L36)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 36
end E213S166
