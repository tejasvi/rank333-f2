module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S234 "data/lean/b44e15b3ca55f77a408c1ab115889e42/E213S234.bin"
namespace E213S234
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [244, 282], [148], 3)], 0, E213S234.L1),
([(7, true, false, [244, 282], [148], 4)], 0, E213S234.L2),
([(7, true, false, [244, 282], [148], 7)], 0, E213S234.L3),
([(7, true, false, [244, 282], [148], 12)], 0, E213S234.L4),
([(7, true, false, [244, 282], [148], 18)], 0, E213S234.L5),
([(7, true, false, [244, 282], [148], 25)], 0, E213S234.L6),
([(7, true, false, [244, 282], [148], 27)], 0, E213S234.L7),
([(7, true, false, [244, 282], [148], 30)], 0, E213S234.L8),
([(7, true, false, [244, 282], [148], 40)], 0, E213S234.L9),
([(7, true, false, [244, 282], [148], 41)], 0, E213S234.L10),
([(7, true, false, [244, 282], [148], 42)], 0, E213S234.L11),
([(7, true, false, [244, 282], [148], 43)], 0, E213S234.L12),
([(7, true, false, [244, 282], [148], 46)], 0, E213S234.L13),
([(7, true, false, [244, 282], [148], 47)], 0, E213S234.L14),
([(7, true, false, [244, 282], [148], 49)], 0, E213S234.L15),
([(7, true, false, [244, 282], [148], 57)], 0, E213S234.L16),
([(7, true, false, [244, 282], [148], 63)], 0, E213S234.L17),
([(7, true, false, [244, 282], [148], 69)], 0, E213S234.L18),
([(7, true, false, [244, 282], [148], 73)], 0, E213S234.L19),
([(7, true, false, [244, 282], [148], 81)], 0, E213S234.L20),
([(7, true, false, [244, 282], [148], 98)], 0, E213S234.L21),
([(7, true, false, [244, 282], [148], 107)], 0, E213S234.L22),
([(7, true, false, [244, 282], [148], 112)], 0, E213S234.L23),
([(7, true, false, [244, 282], [148], 129)], 0, E213S234.L24)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 24
end E213S234
