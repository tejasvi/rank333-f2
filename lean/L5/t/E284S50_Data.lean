module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S50 "data/lean/5c85b0e61522d02d3c051b9df444671d/E284S50.bin"
namespace E284S50
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [382, 426], [10], 1)], 0, E284S50.L1),
([(9, true, false, [382, 426], [10], 10)], 0, E284S50.L2),
([(9, true, false, [382, 426], [10], 11)], 0, E284S50.L3),
([(9, true, false, [382, 426], [10], 12)], 0, E284S50.L4),
([(9, true, false, [382, 426], [10], 15)], 0, E284S50.L5),
([(9, true, false, [382, 426], [10], 17)], 0, E284S50.L6),
([(9, true, false, [382, 426], [10], 30)], 0, E284S50.L7),
([(9, true, false, [382, 426], [10], 34)], 0, E284S50.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 8
end E284S50
