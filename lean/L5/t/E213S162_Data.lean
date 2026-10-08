module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S162 "data/lean/311c9c3f88f3558c35e3d3a39281b1f1/E213S162.bin"
namespace E213S162
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(12, true, false, [106, 244, 254], [368], 35)], 0, E213S162.L1),
([(12, true, false, [106, 244, 254], [368], 76)], 0, E213S162.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E213S162
