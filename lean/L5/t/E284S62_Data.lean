module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S62 "data/lean/d181f8f242a8beeacfa0c290c71499f5/E284S62.bin"
namespace E284S62
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [212, 382], [10, 138], 0)], 0, E284S62.L1),
([(3, true, false, [212, 382], [10, 138], 1)], 0, E284S62.L2),
([(3, true, false, [212, 382], [10, 138], 21)], 0, E284S62.L3),
([(3, true, false, [212, 382], [10, 138], 23)], 0, E284S62.L4),
([(3, true, false, [212, 382], [10, 138], 61)], 0, E284S62.L5),
([(3, true, false, [212, 382], [10, 138], 68)], 0, E284S62.L6),
([(3, true, false, [212, 382], [10, 138], 72)], 0, E284S62.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E284S62
