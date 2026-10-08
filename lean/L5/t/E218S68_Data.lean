module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S68 "data/lean/a4ec9d1a4656e8d72531ff356e553fd0/E218S68.bin"
namespace E218S68
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [254], [112, 352], 3)], 0, E218S68.L1),
([(7, true, false, [254], [112, 352], 9)], 0, E218S68.L2),
([(7, true, false, [254], [112, 352], 46)], 0, E218S68.L3),
([(7, true, false, [254], [112, 352], 47)], 0, E218S68.L4),
([(7, true, false, [254], [112, 352], 48)], 0, E218S68.L5),
([(7, true, false, [254], [112, 352], 49)], 0, E218S68.L6),
([(7, true, false, [254], [112, 352], 57)], 0, E218S68.L7),
([(7, true, false, [254], [112, 352], 64)], 0, E218S68.L8),
([(7, true, false, [254], [112, 352], 67)], 0, E218S68.L9),
([(7, true, false, [254], [112, 352], 69)], 0, E218S68.L10),
([(7, true, false, [254], [112, 352], 71)], 0, E218S68.L11),
([(7, true, false, [254], [112, 352], 72)], 0, E218S68.L12),
([(7, true, false, [254], [112, 352], 74)], 0, E218S68.L13),
([(7, true, false, [254], [112, 352], 76)], 0, E218S68.L14),
([(7, true, false, [254], [112, 352], 79)], 0, E218S68.L15)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 15
end E218S68
