module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S269 "data/lean/effbf514f3e32392303fd2788691e8b1/E284S269.bin"
namespace E284S269
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [372, 426, 94], [10], 10)], 0, E284S269.L1),
([(2, true, false, [372, 426, 94], [10], 13)], 0, E284S269.L2),
([(2, true, false, [372, 426, 94], [10], 20)], 0, E284S269.L3),
([(2, true, false, [372, 426, 94], [10], 44)], 0, E284S269.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E284S269
