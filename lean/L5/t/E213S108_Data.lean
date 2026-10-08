module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S108 "data/lean/75cde90ec8ad973fd1c0dcb160ed75be/E213S108.bin"
namespace E213S108
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [254], [148, 388], 4)], 0, E213S108.L1),
([(3, true, false, [254], [148, 388], 7)], 0, E213S108.L2),
([(3, true, false, [254], [148, 388], 26)], 0, E213S108.L3),
([(3, true, false, [254], [148, 388], 46)], 0, E213S108.L4),
([(3, true, false, [254], [148, 388], 48)], 0, E213S108.L5),
([(3, true, false, [254], [148, 388], 61)], 0, E213S108.L6),
([(3, true, false, [254], [148, 388], 71)], 0, E213S108.L7),
([(3, true, false, [254], [148, 388], 73)], 0, E213S108.L8),
([(3, true, false, [254], [148, 388], 75)], 0, E213S108.L9),
([(3, true, false, [254], [148, 388], 91)], 0, E213S108.L10),
([(3, true, false, [254], [148, 388], 96)], 0, E213S108.L11),
([(3, true, false, [254], [148, 388], 120)], 0, E213S108.L12)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 12
end E213S108
