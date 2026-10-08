module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E204S4 "data/lean/052797f3ca76899eae78aaa6baa80683/E204S4.bin"
namespace E204S4
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [334, 494], [], 1)], 0, E204S4.L1),
([(3, true, false, [334, 494], [], 21)], 0, E204S4.L2),
([(3, true, false, [334, 494], [], 84)], 0, E204S4.L3),
([(3, true, false, [334, 494], [], 138)], 0, E204S4.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E204S4
