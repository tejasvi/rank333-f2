module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S92 "data/lean/3030d7fc3ee634dcd6714ca36d457c33/E213S92.bin"
namespace E213S92
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [158], [148], 0)], 0, E213S92.L1),
([(7, true, false, [158], [148], 2)], 0, E213S92.L2),
([(7, true, false, [158], [148], 3)], 0, E213S92.L3),
([(7, true, false, [158], [148], 6)], 0, E213S92.L4),
([(7, true, false, [158], [148], 7)], 0, E213S92.L5),
([(7, true, false, [158], [148], 12)], 0, E213S92.L6),
([(7, true, false, [158], [148], 20)], 0, E213S92.L7),
([(7, true, false, [158], [148], 36)], 28, E213S92.L8),
([(7, true, false, [158], [148], 37)], 0, E213S92.L9),
([(7, true, false, [158], [148], 38)], 0, E213S92.L10),
([(7, true, false, [158], [148], 39)], 0, E213S92.L11),
([(7, true, false, [158], [148], 40)], 0, E213S92.L12),
([(7, true, false, [158], [148], 41)], 0, E213S92.L13),
([(7, true, false, [158], [148], 43)], 0, E213S92.L14),
([(7, true, false, [158], [148], 44)], 0, E213S92.L15),
([(7, true, false, [158], [148], 45)], 0, E213S92.L16),
([(7, true, false, [158], [148], 46)], 0, E213S92.L17),
([(7, true, false, [158], [148], 48)], 0, E213S92.L18),
([(7, true, false, [158], [148], 49)], 0, E213S92.L19),
([(7, true, false, [158], [148], 50)], 0, E213S92.L20),
([(7, true, false, [158], [148], 51)], 0, E213S92.L21),
([(7, true, false, [158], [148], 52)], 0, E213S92.L22),
([(7, true, false, [158], [148], 55)], 0, E213S92.L23),
([(7, true, false, [158], [148], 72)], 0, E213S92.L24),
([(7, true, false, [158], [148], 73)], 0, E213S92.L25),
([(7, true, false, [158], [148], 87)], 0, E213S92.L26),
([(7, true, false, [158], [148], 108)], 0, E213S92.L27),
([(7, true, false, [158], [148], 110)], 0, E213S92.L28),
([(7, true, false, [158], [148], 112)], 0, E213S92.L29),
([(7, true, false, [158], [148], 124)], 0, E213S92.L30),
([(7, true, false, [158], [148], 136)], 0, E213S92.L31),
([(7, true, false, [158], [148], 194)], 0, E213S92.L32),
([(7, true, false, [158], [148], 211)], 0, E213S92.L33),
([(7, true, false, [158], [148], 214)], 0, E213S92.L34),
([(7, true, false, [158], [148], 36), (13, false, false, [282], [272, 484], 28)], 0, E213S92.L35),
([(7, true, false, [158], [148], 36), (13, false, false, [282], [272, 484], 176)], 0, E213S92.L36),
([(7, true, false, [158], [148], 36), (13, false, false, [282], [272, 484], 324)], 0, E213S92.L37),
([(7, true, false, [158], [148], 36), (13, false, false, [282], [272, 484], 472)], 0, E213S92.L38),
([(7, true, false, [158], [148], 36), (13, false, false, [282], [272, 484], 508)], 0, E213S92.L39),
([(7, true, false, [158], [148], 36), (13, false, false, [282], [272, 484], 509)], 0, E213S92.L40),
([(7, true, false, [158], [148], 36), (13, false, false, [282], [272, 484], 556)], 0, E213S92.L41),
([(7, true, false, [158], [148], 36), (13, false, false, [282], [272, 484], 557)], 0, E213S92.L42),
([(7, true, false, [158], [148], 36), (13, false, false, [282], [272, 484], 672)], 0, E213S92.L43),
([(7, true, false, [158], [148], 36), (13, false, false, [282], [272, 484], 820)], 0, E213S92.L44),
([(7, true, false, [158], [148], 36), (13, false, false, [282], [272, 484], 968)], 0, E213S92.L45),
([(7, true, false, [158], [148], 36), (13, false, false, [282], [272, 484], 1108)], 0, E213S92.L46),
([(7, true, false, [158], [148], 36), (13, false, false, [282], [272, 484], 1172)], 0, E213S92.L47),
([(7, true, false, [158], [148], 36), (13, false, false, [282], [272, 484], 1173)], 0, E213S92.L48),
([(7, true, false, [158], [148], 36), (13, false, false, [282], [272, 484], 1184)], 0, E213S92.L49),
([(7, true, false, [158], [148], 36), (13, false, false, [282], [272, 484], 1185)], 0, E213S92.L50),
([(7, true, false, [158], [148], 36), (13, false, false, [282], [272, 484], 1308)], 0, E213S92.L51),
([(7, true, false, [158], [148], 36), (13, false, false, [282], [272, 484], 1452)], 0, E213S92.L52),
([(7, true, false, [158], [148], 36), (13, false, false, [282], [272, 484], 1600)], 0, E213S92.L53),
([(7, true, false, [158], [148], 36), (13, false, false, [282], [272, 484], 1744)], 0, E213S92.L54),
([(7, true, false, [158], [148], 36), (13, false, false, [282], [272, 484], 1780)], 0, E213S92.L55),
([(7, true, false, [158], [148], 36), (13, false, false, [282], [272, 484], 1781)], 0, E213S92.L56),
([(7, true, false, [158], [148], 36), (13, false, false, [282], [272, 484], 1824)], 0, E213S92.L57),
([(7, true, false, [158], [148], 36), (13, false, false, [282], [272, 484], 1825)], 0, E213S92.L58),
([(7, true, false, [158], [148], 36), (13, false, false, [282], [272, 484], 1944)], 0, E213S92.L59),
([(7, true, false, [158], [148], 36), (13, false, false, [282], [272, 484], 2088)], 0, E213S92.L60),
([(7, true, false, [158], [148], 36), (13, false, false, [282], [272, 484], 2228)], 0, E213S92.L61),
([(7, true, false, [158], [148], 36), (13, false, false, [282], [272, 484], 2380)], 0, E213S92.L62)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 34
end E213S92
