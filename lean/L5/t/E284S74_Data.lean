module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S74 "data/lean/6b1872bae75df4488a0ece658e86dbe2/E284S74.bin"
namespace E284S74
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [94, 298], [138], 11)], 0, E284S74.L1),
([(9, true, false, [94, 298], [138], 14)], 0, E284S74.L2),
([(9, true, false, [94, 298], [138], 20)], 0, E284S74.L3),
([(9, true, false, [94, 298], [138], 27)], 0, E284S74.L4),
([(9, true, false, [94, 298], [138], 34)], 0, E284S74.L5),
([(9, true, false, [94, 298], [138], 76)], 0, E284S74.L6),
([(9, true, false, [94, 298], [138], 109)], 0, E284S74.L7),
([(9, true, false, [94, 298], [138], 110)], 0, E284S74.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 8
end E284S74
