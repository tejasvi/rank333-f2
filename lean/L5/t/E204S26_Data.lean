module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E204S26 "data/lean/5db90efa95851df38dcf9e07d8c391b7/E204S26.bin"
namespace E204S26
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [266, 334, 372, 468], [], 0)], 0, E204S26.L1),
([(0, true, false, [266, 334, 372, 468], [], 1)], 0, E204S26.L2),
([(0, true, false, [266, 334, 372, 468], [], 5)], 0, E204S26.L3),
([(0, true, false, [266, 334, 372, 468], [], 6)], 0, E204S26.L4),
([(0, true, false, [266, 334, 372, 468], [], 9)], 0, E204S26.L5),
([(0, true, false, [266, 334, 372, 468], [], 17)], 0, E204S26.L6),
([(0, true, false, [266, 334, 372, 468], [], 29)], 0, E204S26.L7),
([(0, true, false, [266, 334, 372, 468], [], 30)], 0, E204S26.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 8
end E204S26
