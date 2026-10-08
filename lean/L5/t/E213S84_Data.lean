module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S84 "data/lean/8e4f15706cf907aea8aca7a2a4fc3ae8/E213S84.bin"
namespace E213S84
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [158], [148], 3)], 0, E213S84.L1),
([(4, true, false, [158], [148], 36)], 0, E213S84.L2),
([(4, true, false, [158], [148], 51)], 0, E213S84.L3),
([(4, true, false, [158], [148], 93)], 0, E213S84.L4),
([(4, true, false, [158], [148], 136)], 0, E213S84.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E213S84
