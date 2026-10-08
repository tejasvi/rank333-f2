module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S434 "data/lean/3e8435b39174f442ba93520dc4517ea2/E236S434.bin"
namespace E236S434
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [354, 394, 412], [258], 0)], 0, E236S434.L1),
([(5, true, false, [354, 394, 412], [258], 4)], 0, E236S434.L2),
([(5, true, false, [354, 394, 412], [258], 37)], 0, E236S434.L3),
([(5, true, false, [354, 394, 412], [258], 56)], 0, E236S434.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E236S434
