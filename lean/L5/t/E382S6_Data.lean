module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E382S6 "data/lean/bb711620fd48f2267de23dd910a7f2c9/E382S6.bin"
namespace E382S6
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [111, 299, 410], [], 10)], 0, E382S6.L1),
([(0, true, false, [111, 299, 410], [], 11)], 0, E382S6.L2),
([(0, true, false, [111, 299, 410], [], 76)], 0, E382S6.L3),
([(0, true, false, [111, 299, 410], [], 77)], 0, E382S6.L4),
([(0, true, false, [111, 299, 410], [], 182)], 0, E382S6.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E382S6
