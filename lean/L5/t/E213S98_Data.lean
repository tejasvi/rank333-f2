module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S98 "data/lean/2daae8aec40fc35c09bb9b5b8db11897/E213S98.bin"
namespace E213S98
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [106, 244, 254], [388], 0)], 0, E213S98.L1),
([(2, true, false, [106, 244, 254], [388], 2)], 0, E213S98.L2),
([(2, true, false, [106, 244, 254], [388], 12)], 0, E213S98.L3),
([(2, true, false, [106, 244, 254], [388], 14)], 0, E213S98.L4),
([(2, true, false, [106, 244, 254], [388], 32)], 0, E213S98.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E213S98
