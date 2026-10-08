module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S45 "data/lean/c400652d4dbeb268f54a4c6ca6f734e8/E284S45.bin"
namespace E284S45
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [84, 426], [10], 10)], 0, E284S45.L1),
([(3, true, false, [84, 426], [10], 11)], 0, E284S45.L2),
([(3, true, false, [84, 426], [10], 12)], 0, E284S45.L3),
([(3, true, false, [84, 426], [10], 14)], 0, E284S45.L4),
([(3, true, false, [84, 426], [10], 20)], 0, E284S45.L5),
([(3, true, false, [84, 426], [10], 24)], 0, E284S45.L6),
([(3, true, false, [84, 426], [10], 40)], 0, E284S45.L7),
([(3, true, false, [84, 426], [10], 44)], 0, E284S45.L8),
([(3, true, false, [84, 426], [10], 56)], 0, E284S45.L9),
([(3, true, false, [84, 426], [10], 58)], 0, E284S45.L10),
([(3, true, false, [84, 426], [10], 102)], 0, E284S45.L11),
([(3, true, false, [84, 426], [10], 120)], 0, E284S45.L12),
([(3, true, false, [84, 426], [10], 130)], 0, E284S45.L13),
([(3, true, false, [84, 426], [10], 131)], 0, E284S45.L14)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 14
end E284S45
