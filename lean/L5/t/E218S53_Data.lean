module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S53 "data/lean/0791fa82a90adac863f3b3e74b1ef1c1/E218S53.bin"
namespace E218S53
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [142], [112, 272], 1)], 0, E218S53.L1),
([(2, true, false, [142], [112, 272], 5)], 0, E218S53.L2),
([(2, true, false, [142], [112, 272], 7)], 0, E218S53.L3),
([(2, true, false, [142], [112, 272], 68)], 0, E218S53.L4),
([(2, true, false, [142], [112, 272], 73)], 0, E218S53.L5),
([(2, true, false, [142], [112, 272], 76)], 0, E218S53.L6),
([(2, true, false, [142], [112, 272], 85)], 0, E218S53.L7),
([(2, true, false, [142], [112, 272], 90)], 0, E218S53.L8),
([(2, true, false, [142], [112, 272], 91)], 0, E218S53.L9),
([(2, true, false, [142], [112, 272], 95)], 0, E218S53.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E218S53
