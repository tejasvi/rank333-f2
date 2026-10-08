module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S44 "data/lean/32559ba835a5c5ff399fde17665935f7/E236S44.bin"
namespace E236S44
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [372, 394, 412], [96], 15)], 0, E236S44.L1),
([(0, true, false, [372, 394, 412], [96], 17)], 0, E236S44.L2),
([(0, true, false, [372, 394, 412], [96], 24)], 0, E236S44.L3),
([(0, true, false, [372, 394, 412], [96], 61)], 0, E236S44.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E236S44
