module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S215 "data/lean/75f5cd81a8733201c71f635ca5bf3640/E236S215.bin"
namespace E236S215
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [158, 412], [22, 276], 17)], 0, E236S215.L1),
([(5, true, false, [158, 412], [22, 276], 27)], 0, E236S215.L2),
([(5, true, false, [158, 412], [22, 276], 31)], 0, E236S215.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E236S215
