module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S157 "data/lean/ab653cd93c96034036ab1a65383881c6/E284S157.bin"
namespace E284S157
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [266, 426], [42, 138], 0)], 0, E284S157.L1),
([(7, true, false, [266, 426], [42, 138], 2)], 0, E284S157.L2),
([(7, true, false, [266, 426], [42, 138], 3)], 0, E284S157.L3),
([(7, true, false, [266, 426], [42, 138], 4)], 0, E284S157.L4),
([(7, true, false, [266, 426], [42, 138], 5)], 0, E284S157.L5),
([(7, true, false, [266, 426], [42, 138], 6)], 0, E284S157.L6),
([(7, true, false, [266, 426], [42, 138], 7)], 0, E284S157.L7),
([(7, true, false, [266, 426], [42, 138], 8)], 0, E284S157.L8),
([(7, true, false, [266, 426], [42, 138], 9)], 0, E284S157.L9),
([(7, true, false, [266, 426], [42, 138], 10)], 0, E284S157.L10),
([(7, true, false, [266, 426], [42, 138], 11)], 0, E284S157.L11),
([(7, true, false, [266, 426], [42, 138], 12)], 0, E284S157.L12),
([(7, true, false, [266, 426], [42, 138], 15)], 0, E284S157.L13),
([(7, true, false, [266, 426], [42, 138], 17)], 0, E284S157.L14),
([(7, true, false, [266, 426], [42, 138], 36)], 0, E284S157.L15)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 15
end E284S157
