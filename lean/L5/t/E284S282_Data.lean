module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S282 "data/lean/67e9ea187a59e6b274b961a1262c9259/E284S282.bin"
namespace E284S282
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [372, 254], [10, 138], 40)], 0, E284S282.L1),
([(2, true, false, [372, 254], [10, 138], 43)], 0, E284S282.L2),
([(2, true, false, [372, 254], [10, 138], 49)], 0, E284S282.L3),
([(2, true, false, [372, 254], [10, 138], 65)], 0, E284S282.L4),
([(2, true, false, [372, 254], [10, 138], 69)], 0, E284S282.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E284S282
