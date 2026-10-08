module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S158 "data/lean/0e125ceb2c961a9c3b6365d07afd5ddc/E284S158.bin"
namespace E284S158
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [266, 426], [42, 138], 0)], 0, E284S158.L1),
([(7, true, false, [266, 426], [42, 138], 2)], 0, E284S158.L2),
([(7, true, false, [266, 426], [42, 138], 5)], 0, E284S158.L3),
([(7, true, false, [266, 426], [42, 138], 22)], 0, E284S158.L4),
([(7, true, false, [266, 426], [42, 138], 26)], 0, E284S158.L5),
([(7, true, false, [266, 426], [42, 138], 27)], 0, E284S158.L6),
([(7, true, false, [266, 426], [42, 138], 32)], 0, E284S158.L7),
([(7, true, false, [266, 426], [42, 138], 35)], 0, E284S158.L8),
([(7, true, false, [266, 426], [42, 138], 36)], 0, E284S158.L9),
([(7, true, false, [266, 426], [42, 138], 38)], 0, E284S158.L10),
([(7, true, false, [266, 426], [42, 138], 39)], 0, E284S158.L11),
([(7, true, false, [266, 426], [42, 138], 40)], 0, E284S158.L12),
([(7, true, false, [266, 426], [42, 138], 41)], 0, E284S158.L13),
([(7, true, false, [266, 426], [42, 138], 48)], 0, E284S158.L14),
([(7, true, false, [266, 426], [42, 138], 50)], 0, E284S158.L15)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 15
end E284S158
