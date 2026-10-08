module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S269 "data/lean/e2233341dcfd62044bf7d3e976eb1701/E213S269.bin"
namespace E213S269
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(14, true, false, [254, 282, 494, 106, 158], [], 1)], 0, E213S269.L1),
([(14, true, false, [254, 282, 494, 106, 158], [], 10)], 0, E213S269.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E213S269
