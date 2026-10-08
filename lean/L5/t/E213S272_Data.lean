module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S272 "data/lean/2631e69fa3ff97fa989da45213243c8c/E213S272.bin"
namespace E213S272
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [158, 282, 494], [], 0)], 0, E213S272.L1),
([(0, true, false, [158, 282, 494], [], 2)], 0, E213S272.L2),
([(0, true, false, [158, 282, 494], [], 5)], 0, E213S272.L3),
([(0, true, false, [158, 282, 494], [], 6)], 0, E213S272.L4),
([(0, true, false, [158, 282, 494], [], 15)], 0, E213S272.L5),
([(0, true, false, [158, 282, 494], [], 17)], 0, E213S272.L6),
([(0, true, false, [158, 282, 494], [], 42)], 0, E213S272.L7),
([(0, true, false, [158, 282, 494], [], 68)], 0, E213S272.L8),
([(0, true, false, [158, 282, 494], [], 83)], 0, E213S272.L9),
([(0, true, false, [158, 282, 494], [], 107)], 0, E213S272.L10),
([(0, true, false, [158, 282, 494], [], 128)], 0, E213S272.L11)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 11
end E213S272
