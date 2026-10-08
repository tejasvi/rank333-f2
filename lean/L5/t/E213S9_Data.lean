module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S9 "data/lean/356aed8edb44c102c2bcdc2471af87af/E213S9.bin"
namespace E213S9
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(11, true, false, [244], [148], 4)], 0, E213S9.L1),
([(11, true, false, [244], [148], 7)], 0, E213S9.L2),
([(11, true, false, [244], [148], 10)], 0, E213S9.L3),
([(11, true, false, [244], [148], 11)], 0, E213S9.L4),
([(11, true, false, [244], [148], 42)], 0, E213S9.L5),
([(11, true, false, [244], [148], 43)], 0, E213S9.L6),
([(11, true, false, [244], [148], 45)], 0, E213S9.L7),
([(11, true, false, [244], [148], 46)], 0, E213S9.L8),
([(11, true, false, [244], [148], 48)], 0, E213S9.L9),
([(11, true, false, [244], [148], 49)], 0, E213S9.L10),
([(11, true, false, [244], [148], 57)], 0, E213S9.L11),
([(11, true, false, [244], [148], 75)], 0, E213S9.L12),
([(11, true, false, [244], [148], 94)], 0, E213S9.L13),
([(11, true, false, [244], [148], 112)], 0, E213S9.L14),
([(11, true, false, [244], [148], 113)], 0, E213S9.L15),
([(11, true, false, [244], [148], 115)], 0, E213S9.L16),
([(11, true, false, [244], [148], 125)], 0, E213S9.L17)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 17
end E213S9
