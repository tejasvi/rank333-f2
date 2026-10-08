module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S118 "data/lean/511aef4874a4c6cf5061567c26fd3dd4/E218S118.bin"
namespace E218S118
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(10, true, false, [142, 254], [272, 352], 0)], 0, E218S118.L1),
([(10, true, false, [142, 254], [272, 352], 3)], 0, E218S118.L2),
([(10, true, false, [142, 254], [272, 352], 17)], 0, E218S118.L3),
([(10, true, false, [142, 254], [272, 352], 20)], 0, E218S118.L4),
([(10, true, false, [142, 254], [272, 352], 26)], 0, E218S118.L5),
([(10, true, false, [142, 254], [272, 352], 27)], 0, E218S118.L6),
([(10, true, false, [142, 254], [272, 352], 29)], 0, E218S118.L7),
([(10, true, false, [142, 254], [272, 352], 30)], 0, E218S118.L8),
([(10, true, false, [142, 254], [272, 352], 35)], 0, E218S118.L9),
([(10, true, false, [142, 254], [272, 352], 52)], 0, E218S118.L10),
([(10, true, false, [142, 254], [272, 352], 55)], 0, E218S118.L11),
([(10, true, false, [142, 254], [272, 352], 56)], 0, E218S118.L12)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 12
end E218S118
