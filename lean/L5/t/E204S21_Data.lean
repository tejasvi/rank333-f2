module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E204S21 "data/lean/7f1169b734e9f98e90ded6f25c92270f/E204S21.bin"
namespace E204S21
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(11, true, false, [494, 372], [160], 6)], 0, E204S21.L1),
([(11, true, false, [494, 372], [160], 12)], 0, E204S21.L2),
([(11, true, false, [494, 372], [160], 43)], 0, E204S21.L3),
([(11, true, false, [494, 372], [160], 55)], 0, E204S21.L4),
([(11, true, false, [494, 372], [160], 117)], 0, E204S21.L5),
([(11, true, false, [494, 372], [160], 127)], 0, E204S21.L6),
([(11, true, false, [494, 372], [160], 132)], 0, E204S21.L7),
([(11, true, false, [494, 372], [160], 142)], 0, E204S21.L8),
([(11, true, false, [494, 372], [160], 176)], 0, E204S21.L9),
([(11, true, false, [494, 372], [160], 191)], 0, E204S21.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E204S21
