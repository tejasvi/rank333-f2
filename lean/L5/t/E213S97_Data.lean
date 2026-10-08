module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S97 "data/lean/99f016b84d9d9216464253816ecf1269/E213S97.bin"
namespace E213S97
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [254, 494], [378], 0)], 0, E213S97.L1),
([(0, true, false, [254, 494], [378], 24)], 0, E213S97.L2),
([(0, true, false, [254, 494], [378], 44)], 0, E213S97.L3),
([(0, true, false, [254, 494], [378], 69)], 0, E213S97.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E213S97
