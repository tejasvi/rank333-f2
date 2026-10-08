module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S152 "data/lean/0351ec4341f65dad63d62d47371590bb/E218S152.bin"
namespace E218S152
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [142, 106], [112, 352], 0)], 0, E218S152.L1),
([(13, true, false, [142, 106], [112, 352], 8)], 0, E218S152.L2),
([(13, true, false, [142, 106], [112, 352], 12)], 0, E218S152.L3),
([(13, true, false, [142, 106], [112, 352], 30)], 0, E218S152.L4),
([(13, true, false, [142, 106], [112, 352], 47)], 0, E218S152.L5),
([(13, true, false, [142, 106], [112, 352], 48)], 0, E218S152.L6),
([(13, true, false, [142, 106], [112, 352], 51)], 0, E218S152.L7),
([(13, true, false, [142, 106], [112, 352], 52)], 0, E218S152.L8),
([(13, true, false, [142, 106], [112, 352], 54)], 0, E218S152.L9),
([(13, true, false, [142, 106], [112, 352], 57)], 0, E218S152.L10),
([(13, true, false, [142, 106], [112, 352], 59)], 0, E218S152.L11),
([(13, true, false, [142, 106], [112, 352], 60)], 0, E218S152.L12),
([(13, true, false, [142, 106], [112, 352], 62)], 0, E218S152.L13),
([(13, true, false, [142, 106], [112, 352], 69)], 0, E218S152.L14),
([(13, true, false, [142, 106], [112, 352], 71)], 0, E218S152.L15),
([(13, true, false, [142, 106], [112, 352], 74)], 0, E218S152.L16),
([(13, true, false, [142, 106], [112, 352], 76)], 0, E218S152.L17),
([(13, true, false, [142, 106], [112, 352], 79)], 0, E218S152.L18)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 18
end E218S152
