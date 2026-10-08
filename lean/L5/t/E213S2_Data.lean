module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S2 "data/lean/b1685f8bf78495ed01d8325f5d7d7c75/E213S2.bin"
namespace E213S2
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [244], [96, 272], 4)], 0, E213S2.L1),
([(3, true, false, [244], [96, 272], 5)], 0, E213S2.L2),
([(3, true, false, [244], [96, 272], 6)], 0, E213S2.L3),
([(3, true, false, [244], [96, 272], 7)], 0, E213S2.L4),
([(3, true, false, [244], [96, 272], 46)], 0, E213S2.L5),
([(3, true, false, [244], [96, 272], 47)], 0, E213S2.L6),
([(3, true, false, [244], [96, 272], 48)], 0, E213S2.L7),
([(3, true, false, [244], [96, 272], 49)], 0, E213S2.L8),
([(3, true, false, [244], [96, 272], 51)], 0, E213S2.L9),
([(3, true, false, [244], [96, 272], 53)], 0, E213S2.L10),
([(3, true, false, [244], [96, 272], 59)], 0, E213S2.L11),
([(3, true, false, [244], [96, 272], 61)], 0, E213S2.L12),
([(3, true, false, [244], [96, 272], 62)], 0, E213S2.L13),
([(3, true, false, [244], [96, 272], 65)], 0, E213S2.L14),
([(3, true, false, [244], [96, 272], 84)], 0, E213S2.L15),
([(3, true, false, [244], [96, 272], 85)], 0, E213S2.L16),
([(3, true, false, [244], [96, 272], 88)], 0, E213S2.L17),
([(3, true, false, [244], [96, 272], 89)], 0, E213S2.L18),
([(3, true, false, [244], [96, 272], 92)], 0, E213S2.L19),
([(3, true, false, [244], [96, 272], 94)], 0, E213S2.L20),
([(3, true, false, [244], [96, 272], 95)], 0, E213S2.L21)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 21
end E213S2
