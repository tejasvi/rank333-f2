module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E204S31 "data/lean/75155354d84f18959447be71172e72b1/E204S31.bin"
namespace E204S31
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [266, 334, 468, 494], [], 0)], 0, E204S31.L1),
([(0, true, false, [266, 334, 468, 494], [], 1)], 0, E204S31.L2),
([(0, true, false, [266, 334, 468, 494], [], 4)], 0, E204S31.L3),
([(0, true, false, [266, 334, 468, 494], [], 22)], 0, E204S31.L4),
([(0, true, false, [266, 334, 468, 494], [], 25)], 0, E204S31.L5),
([(0, true, false, [266, 334, 468, 494], [], 37)], 0, E204S31.L6),
([(0, true, false, [266, 334, 468, 494], [], 38)], 0, E204S31.L7),
([(0, true, false, [266, 334, 468, 494], [], 61)], 0, E204S31.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 8
end E204S31
