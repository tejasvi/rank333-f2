module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S90 "data/lean/5b7a3ac7387f46739072578e0de9db07/E236S90.bin"
namespace E236S90
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [394, 412], [258], 0)], 0, E236S90.L1),
([(7, true, false, [394, 412], [258], 4)], 0, E236S90.L2),
([(7, true, false, [394, 412], [258], 64)], 0, E236S90.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E236S90
