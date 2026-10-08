module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S149 "data/lean/f3caf2581236e86fb02e67da4a260cb2/E213S149.bin"
namespace E213S149
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [282, 106], [96], 20)], 0, E213S149.L1),
([(9, true, false, [282, 106], [96], 21)], 0, E213S149.L2),
([(9, true, false, [282, 106], [96], 24)], 0, E213S149.L3),
([(9, true, false, [282, 106], [96], 25)], 0, E213S149.L4),
([(9, true, false, [282, 106], [96], 28)], 0, E213S149.L5),
([(9, true, false, [282, 106], [96], 57)], 0, E213S149.L6),
([(9, true, false, [282, 106], [96], 86)], 0, E213S149.L7),
([(9, true, false, [282, 106], [96], 174)], 0, E213S149.L8),
([(9, true, false, [282, 106], [96], 246)], 0, E213S149.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E213S149
