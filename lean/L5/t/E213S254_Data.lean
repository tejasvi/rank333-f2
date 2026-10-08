module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S254 "data/lean/0e5154b2e082b528d53b50f9599a1306/E213S254.bin"
namespace E213S254
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [244, 254, 282, 158], [], 0)], 0, E213S254.L1),
([(2, true, false, [244, 254, 282, 158], [], 4)], 0, E213S254.L2),
([(2, true, false, [244, 254, 282, 158], [], 10)], 0, E213S254.L3),
([(2, true, false, [244, 254, 282, 158], [], 12)], 0, E213S254.L4),
([(2, true, false, [244, 254, 282, 158], [], 51)], 0, E213S254.L5),
([(2, true, false, [244, 254, 282, 158], [], 52)], 0, E213S254.L6),
([(2, true, false, [244, 254, 282, 158], [], 53)], 0, E213S254.L7),
([(2, true, false, [244, 254, 282, 158], [], 54)], 0, E213S254.L8),
([(2, true, false, [244, 254, 282, 158], [], 55)], 0, E213S254.L9),
([(2, true, false, [244, 254, 282, 158], [], 56)], 0, E213S254.L10),
([(2, true, false, [244, 254, 282, 158], [], 57)], 0, E213S254.L11),
([(2, true, false, [244, 254, 282, 158], [], 61)], 0, E213S254.L12),
([(2, true, false, [244, 254, 282, 158], [], 62)], 0, E213S254.L13),
([(2, true, false, [244, 254, 282, 158], [], 65)], 0, E213S254.L14),
([(2, true, false, [244, 254, 282, 158], [], 66)], 0, E213S254.L15),
([(2, true, false, [244, 254, 282, 158], [], 69)], 0, E213S254.L16),
([(2, true, false, [244, 254, 282, 158], [], 72)], 0, E213S254.L17),
([(2, true, false, [244, 254, 282, 158], [], 81)], 0, E213S254.L18),
([(2, true, false, [244, 254, 282, 158], [], 119)], 0, E213S254.L19),
([(2, true, false, [244, 254, 282, 158], [], 121)], 0, E213S254.L20),
([(2, true, false, [244, 254, 282, 158], [], 125)], 0, E213S254.L21),
([(2, true, false, [244, 254, 282, 158], [], 141)], 0, E213S254.L22),
([(2, true, false, [244, 254, 282, 158], [], 187)], 0, E213S254.L23),
([(2, true, false, [244, 254, 282, 158], [], 243)], 0, E213S254.L24)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 24
end E213S254
