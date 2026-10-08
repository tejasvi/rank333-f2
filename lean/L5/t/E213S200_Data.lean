module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S200 "data/lean/eba978c80c33a17ae3fa5dcb1cc02930/E213S200.bin"
namespace E213S200
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [106, 254], [272, 388], 14)], 0, E213S200.L1),
([(2, true, false, [106, 254], [272, 388], 15)], 0, E213S200.L2),
([(2, true, false, [106, 254], [272, 388], 19)], 0, E213S200.L3),
([(2, true, false, [106, 254], [272, 388], 20)], 0, E213S200.L4),
([(2, true, false, [106, 254], [272, 388], 46)], 0, E213S200.L5),
([(2, true, false, [106, 254], [272, 388], 47)], 0, E213S200.L6),
([(2, true, false, [106, 254], [272, 388], 51)], 0, E213S200.L7),
([(2, true, false, [106, 254], [272, 388], 62)], 0, E213S200.L8),
([(2, true, false, [106, 254], [272, 388], 69)], 0, E213S200.L9),
([(2, true, false, [106, 254], [272, 388], 85)], 0, E213S200.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E213S200
