module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E185S24 "data/lean/e6bb91946ae1186129c49c953477877c/E185S24.bin"
namespace E185S24
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(11, true, false, [218], [], 4)], 1, 4, E185S24.L1),
([(11, true, false, [218], [], 4), (0, false, false, [], [], 2)], 5, 0, E185S24.L2),
([(11, true, false, [218], [], 4), (0, false, false, [], [], 10)], 5, 0, E185S24.L3),
([(11, true, false, [218], [], 4), (0, false, false, [], [], 24)], 5, 0, E185S24.L4),
([(11, true, false, [218], [], 4), (0, false, false, [], [], 28)], 5, 0, E185S24.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 1
end E185S24
