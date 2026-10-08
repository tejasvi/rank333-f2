module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E204S36 "data/lean/fc309d5d47a2ccfb34503f7b17cfccc7/E204S36.bin"
namespace E204S36
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [266, 372, 494], [400], 3)], 0, E204S36.L1),
([(0, true, false, [266, 372, 494], [400], 14)], 0, E204S36.L2),
([(0, true, false, [266, 372, 494], [400], 19)], 0, E204S36.L3),
([(0, true, false, [266, 372, 494], [400], 22)], 0, E204S36.L4),
([(0, true, false, [266, 372, 494], [400], 34)], 0, E204S36.L5),
([(0, true, false, [266, 372, 494], [400], 38)], 0, E204S36.L6),
([(0, true, false, [266, 372, 494], [400], 41)], 0, E204S36.L7),
([(0, true, false, [266, 372, 494], [400], 44)], 0, E204S36.L8),
([(0, true, false, [266, 372, 494], [400], 64)], 0, E204S36.L9),
([(0, true, false, [266, 372, 494], [400], 65)], 0, E204S36.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E204S36
