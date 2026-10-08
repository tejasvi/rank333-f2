module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S48 "data/lean/7f2112a1eee36e068b4970f3732ff886/E284S48.bin"
namespace E284S48
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [298, 372], [138], 11)], 0, E284S48.L1),
([(3, true, false, [298, 372], [138], 14)], 0, E284S48.L2),
([(3, true, false, [298, 372], [138], 20)], 0, E284S48.L3),
([(3, true, false, [298, 372], [138], 27)], 0, E284S48.L4),
([(3, true, false, [298, 372], [138], 31)], 0, E284S48.L5),
([(3, true, false, [298, 372], [138], 34)], 0, E284S48.L6),
([(3, true, false, [298, 372], [138], 58)], 0, E284S48.L7),
([(3, true, false, [298, 372], [138], 71)], 0, E284S48.L8),
([(3, true, false, [298, 372], [138], 87)], 0, E284S48.L9),
([(3, true, false, [298, 372], [138], 102)], 0, E284S48.L10),
([(3, true, false, [298, 372], [138], 110)], 0, E284S48.L11),
([(3, true, false, [298, 372], [138], 111)], 0, E284S48.L12)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 12
end E284S48
