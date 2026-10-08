module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S190 "data/lean/f9d6f5c7a7546c361e682e6afea48761/E213S190.bin"
namespace E213S190
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [254, 158], [398], 1)], 0, E213S190.L1),
([(2, true, false, [254, 158], [398], 20)], 0, E213S190.L2),
([(2, true, false, [254, 158], [398], 42)], 0, E213S190.L3),
([(2, true, false, [254, 158], [398], 43)], 0, E213S190.L4),
([(2, true, false, [254, 158], [398], 44)], 0, E213S190.L5),
([(2, true, false, [254, 158], [398], 45)], 0, E213S190.L6),
([(2, true, false, [254, 158], [398], 59)], 0, E213S190.L7),
([(2, true, false, [254, 158], [398], 60)], 0, E213S190.L8),
([(2, true, false, [254, 158], [398], 61)], 0, E213S190.L9),
([(2, true, false, [254, 158], [398], 66)], 0, E213S190.L10),
([(2, true, false, [254, 158], [398], 67)], 0, E213S190.L11),
([(2, true, false, [254, 158], [398], 71)], 0, E213S190.L12),
([(2, true, false, [254, 158], [398], 76)], 0, E213S190.L13),
([(2, true, false, [254, 158], [398], 106)], 0, E213S190.L14),
([(2, true, false, [254, 158], [398], 186)], 0, E213S190.L15),
([(2, true, false, [254, 158], [398], 187)], 0, E213S190.L16),
([(2, true, false, [254, 158], [398], 188)], 0, E213S190.L17)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 17
end E213S190
