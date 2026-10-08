module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S58 "data/lean/3fb87f2a84534b689338d86256a530da/E284S58.bin"
namespace E284S58
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [212, 266, 298], [10, 138], 0)], 0, E284S58.L1),
([(3, true, false, [212, 266, 298], [10, 138], 1)], 0, E284S58.L2),
([(3, true, false, [212, 266, 298], [10, 138], 6)], 0, E284S58.L3),
([(3, true, false, [212, 266, 298], [10, 138], 10)], 0, E284S58.L4),
([(3, true, false, [212, 266, 298], [10, 138], 11)], 0, E284S58.L5),
([(3, true, false, [212, 266, 298], [10, 138], 12)], 0, E284S58.L6),
([(3, true, false, [212, 266, 298], [10, 138], 14)], 0, E284S58.L7),
([(3, true, false, [212, 266, 298], [10, 138], 21)], 0, E284S58.L8),
([(3, true, false, [212, 266, 298], [10, 138], 24)], 0, E284S58.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E284S58
