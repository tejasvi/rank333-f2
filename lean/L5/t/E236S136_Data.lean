module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S136 "data/lean/51289bff6f2ef7c67677064ea2010aff/E236S136.bin"
namespace E236S136
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [158, 254, 412], [508], 0)], 0, E236S136.L1),
([(6, true, false, [158, 254, 412], [508], 40)], 0, E236S136.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E236S136
