module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S352 "data/lean/99a487bd15606f6d3f1bb0dedb12f578/E284S352.bin"
namespace E284S352
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [94, 212, 340, 478, 84, 468], [], 5)], 0, E284S352.L1),
([(4, true, false, [94, 212, 340, 478, 84, 468], [], 7)], 0, E284S352.L2),
([(4, true, false, [94, 212, 340, 478, 84, 468], [], 72)], 0, E284S352.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E284S352
