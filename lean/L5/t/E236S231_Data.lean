module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S231 "data/lean/1b653c4a63572d72df2576ce834caca4/E236S231.bin"
namespace E236S231
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [254, 412], [136], 1)], 0, E236S231.L1),
([(8, true, false, [254, 412], [136], 5)], 0, E236S231.L2),
([(8, true, false, [254, 412], [136], 11)], 0, E236S231.L3),
([(8, true, false, [254, 412], [136], 14)], 0, E236S231.L4),
([(8, true, false, [254, 412], [136], 31)], 0, E236S231.L5),
([(8, true, false, [254, 412], [136], 59)], 0, E236S231.L6),
([(8, true, false, [254, 412], [136], 83)], 0, E236S231.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E236S231
