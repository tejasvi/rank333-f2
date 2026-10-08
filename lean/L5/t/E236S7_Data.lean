module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S7 "data/lean/53c4bf8124dabd03e205a7986d8198ce/E236S7.bin"
namespace E236S7
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(12, true, false, [], [96, 232], 1)], 0, E236S7.L1),
([(12, true, false, [], [96, 232], 144)], 0, E236S7.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E236S7
