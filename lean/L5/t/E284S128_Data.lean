module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S128 "data/lean/316cf757907a272e51b8d0d68e20801b/E284S128.bin"
namespace E284S128
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [266, 426], [42, 138], 2)], 0, E284S128.L1),
([(3, true, false, [266, 426], [42, 138], 3)], 0, E284S128.L2),
([(3, true, false, [266, 426], [42, 138], 4)], 0, E284S128.L3),
([(3, true, false, [266, 426], [42, 138], 5)], 0, E284S128.L4),
([(3, true, false, [266, 426], [42, 138], 6)], 0, E284S128.L5),
([(3, true, false, [266, 426], [42, 138], 9)], 0, E284S128.L6),
([(3, true, false, [266, 426], [42, 138], 10)], 0, E284S128.L7),
([(3, true, false, [266, 426], [42, 138], 11)], 0, E284S128.L8),
([(3, true, false, [266, 426], [42, 138], 22)], 0, E284S128.L9),
([(3, true, false, [266, 426], [42, 138], 27)], 0, E284S128.L10),
([(3, true, false, [266, 426], [42, 138], 36)], 0, E284S128.L11),
([(3, true, false, [266, 426], [42, 138], 41)], 0, E284S128.L12),
([(3, true, false, [266, 426], [42, 138], 48)], 0, E284S128.L13),
([(3, true, false, [266, 426], [42, 138], 49)], 0, E284S128.L14)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 14
end E284S128
