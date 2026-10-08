module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S47 "data/lean/5dcd3cce7e484405c7f7f5c7cd24595b/E213S47.bin"
namespace E213S47
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [106, 158, 494], [378], 0)], 0, E213S47.L1),
([(0, true, false, [106, 158, 494], [378], 3)], 0, E213S47.L2),
([(0, true, false, [106, 158, 494], [378], 11)], 0, E213S47.L3),
([(0, true, false, [106, 158, 494], [378], 12)], 0, E213S47.L4),
([(0, true, false, [106, 158, 494], [378], 16)], 0, E213S47.L5),
([(0, true, false, [106, 158, 494], [378], 28)], 0, E213S47.L6),
([(0, true, false, [106, 158, 494], [378], 31)], 0, E213S47.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E213S47
